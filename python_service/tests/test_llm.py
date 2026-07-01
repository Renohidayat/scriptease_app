import pytest
import respx
import asyncio
from unittest.mock import patch
from httpx import Response
from httpx import ASGITransport, AsyncClient
from app.services.llm.llm_service import create_llm_provider, LLMProviderError
from app.core.config import settings
from main import app

@pytest.fixture(autouse=True)
def mock_settings():
    settings.OPENAI_API_KEY = "test_key"
    settings.GEMINI_API_KEY = "test_key"
    settings.ANTHROPIC_API_KEY = "test_key"

@pytest.mark.asyncio
@respx.mock
async def test_openai_provider_success():
    respx.post("https://api.openai.com/v1/chat/completions").mock(
        return_value=Response(
            200, 
            content=b'data: {"choices": [{"delta": {"content": "Hello"}}]}\n\ndata: {"choices": [{"delta": {"content": " World"}}]}\n\ndata: [DONE]\n\n',
            headers={"Content-Type": "text/event-stream"}
        )
    )
    provider = create_llm_provider("openai")
    chunks = []
    async for chunk in provider.stream([{"role": "user", "content": "hi"}], "system", "gpt-4o"):
        chunks.append(chunk)
    assert chunks == ["Hello", " World"]

@pytest.mark.asyncio
@respx.mock
async def test_openai_provider_error():
    respx.post("https://api.openai.com/v1/chat/completions").mock(
        return_value=Response(401, json={"error": {"message": "Invalid API Key"}})
    )
    provider = create_llm_provider("openai")
    with pytest.raises(LLMProviderError) as exc_info:
        async for _ in provider.stream([{"role": "user", "content": "hi"}], "system", "gpt-4o"):
            pass
    assert "OpenAI Error" in str(exc_info.value)

@pytest.mark.asyncio
@respx.mock
async def test_anthropic_provider_success():
    anthropic_payload = b'event: message_start\ndata: {"type": "message_start", "message": {"id": "1", "type": "message", "role": "assistant", "content": [], "model": "claude-3", "stop_reason": null, "stop_sequence": null, "usage": {"input_tokens": 10, "output_tokens": 1}}}\n\nevent: content_block_start\ndata: {"type": "content_block_start", "index": 0, "content_block": {"type": "text", "text": ""}}\n\nevent: content_block_delta\ndata: {"type": "content_block_delta", "index": 0, "delta": {"type": "text_delta", "text": "Hello Anthropic"}}\n\nevent: message_stop\ndata: {"type": "message_stop"}\n\n'
    respx.post("https://api.anthropic.com/v1/messages").mock(
        return_value=Response(200, content=anthropic_payload, headers={"Content-Type": "text/event-stream"})
    )
    provider = create_llm_provider("anthropic")
    chunks = []
    async for chunk in provider.stream([{"role": "user", "content": "hi"}], "sys", "claude-3"):
        chunks.append(chunk)
    assert chunks == ["Hello Anthropic"]

@pytest.mark.asyncio
@respx.mock
async def test_anthropic_provider_error():
    respx.post("https://api.anthropic.com/v1/messages").mock(
        return_value=Response(401, json={"error": {"type": "authentication_error", "message": "invalid x-api-key"}})
    )
    provider = create_llm_provider("anthropic")
    with pytest.raises(LLMProviderError) as exc:
        async for _ in provider.stream([{"role": "user", "content": "hi"}], "sys", "claude-3"):
            pass
    assert "Anthropic Error" in str(exc.value)

@pytest.mark.asyncio
async def test_gemini_provider_success():
    with patch("google.generativeai.GenerativeModel.generate_content_async") as mock_gen:
        async def mock_stream():
            class MockChunk:
                text = "Hello Gemini"
            yield MockChunk()
        mock_gen.return_value = mock_stream()
        
        provider = create_llm_provider("gemini")
        chunks = []
        async for chunk in provider.stream([{"role": "user", "content": "hi"}], "sys", "gemini-1.5"):
            chunks.append(chunk)
        assert chunks == ["Hello Gemini"]

@pytest.mark.asyncio
async def test_gemini_provider_error():
    with patch("google.generativeai.GenerativeModel.generate_content_async") as mock_gen:
        mock_gen.side_effect = Exception("API Key not valid")
        
        provider = create_llm_provider("gemini")
        with pytest.raises(LLMProviderError) as exc:
            async for _ in provider.stream([{"role": "user", "content": "hi"}], "sys", "gemini-1.5"):
                pass
        assert "Gemini Error" in str(exc.value)

@pytest.mark.asyncio
@respx.mock
async def test_openai_cancellation():
    async def delayed_response(request):
        await asyncio.sleep(0.5)
        return Response(200, content=b'data: [DONE]\n\n', headers={"Content-Type": "text/event-stream"})
    
    respx.post("https://api.openai.com/v1/chat/completions").mock(side_effect=delayed_response)
    provider = create_llm_provider("openai")
    
    async def run_stream():
        async for _ in provider.stream([{"role": "user", "content": "hi"}], "sys", "gpt-4o"):
            pass

    task = asyncio.create_task(run_stream())
    await asyncio.sleep(0.1)
    task.cancel()
    
    with pytest.raises(asyncio.CancelledError):
        await task

@pytest.mark.asyncio
async def test_factory_invalid_provider():
    with pytest.raises(LLMProviderError, match="API key missing for provider: invalid"):
        create_llm_provider("invalid")

@pytest.mark.asyncio
@respx.mock
async def test_llm_endpoint_stream():
    respx.post("https://api.openai.com/v1/chat/completions").mock(
        return_value=Response(
            200, 
            content=b'data: {"choices": [{"delta": {"content": "Hello"}}]}\n\ndata: {"choices": [{"delta": {"content": " World"}}]}\n\ndata: [DONE]\n\n',
            headers={"Content-Type": "text/event-stream"}
        )
    )
    
    async with AsyncClient(transport=ASGITransport(app=app), base_url="http://test") as ac:
        response = await ac.post("/api/v1/llm/stream", json={
            "provider": "openai",
            "model": "gpt-4o",
            "messages": [{"role": "user", "content": "hello"}],
            "user_prompt": "hello"
        })
        assert response.status_code == 200
        text = response.text
        assert 'data: {"chunk": "Hello", "done": false}' in text
        assert 'data: {"chunk": " World", "done": false}' in text
        assert 'data: {"chunk": "", "full_text": "Hello World", "done": true}' in text

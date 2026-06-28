"""
LLM Service — Provider-agnostic streaming LLM client
Supports: OpenAI, Anthropic Claude, Google Gemini
"""

from abc import ABC, abstractmethod
from typing import AsyncGenerator
import openai
import anthropic
import google.generativeai as genai
from app.core.config import settings


class LLMProvider(ABC):
    @abstractmethod
    async def stream(
        self,
        messages: list[dict],
        system: str,
        model: str,
        temperature: float = 0.7,
        max_tokens: int = 4096,
    ) -> AsyncGenerator[str, None]:
        pass


class OpenAIProvider(LLMProvider):
    def __init__(self, api_key: str):
        self.client = openai.AsyncOpenAI(api_key=api_key)

    async def stream(self, messages, system, model, temperature=0.7, max_tokens=4096):
        full_messages = [{"role": "system", "content": system}, *messages]
        async with self.client.chat.completions.stream(
            model=model,
            messages=full_messages,
            temperature=temperature,
            max_tokens=max_tokens,
        ) as stream:
            async for chunk in stream:
                delta = chunk.choices[0].delta.content
                if delta:
                    yield delta


class AnthropicProvider(LLMProvider):
    def __init__(self, api_key: str):
        self.client = anthropic.AsyncAnthropic(api_key=api_key)

    async def stream(self, messages, system, model, temperature=0.7, max_tokens=4096):
        async with self.client.messages.stream(
            model=model,
            system=system,
            messages=messages,
            temperature=temperature,
            max_tokens=max_tokens,
        ) as stream:
            async for text in stream.text_stream:
                yield text


class GeminiProvider(LLMProvider):
    def __init__(self, api_key: str):
        genai.configure(api_key=api_key)
        self.model_name = None

    async def stream(self, messages, system, model, temperature=0.7, max_tokens=4096):
        genai_model = genai.GenerativeModel(
            model_name=model,
            system_instruction=system,
        )
        # Convert OpenAI-style messages to Gemini format
        gemini_messages = [
            {"role": m["role"].replace("assistant", "model"),
             "parts": [m["content"]]}
            for m in messages
        ]
        response = await genai_model.generate_content_async(
            gemini_messages,
            generation_config=genai.GenerationConfig(
                temperature=temperature,
                max_output_tokens=max_tokens,
            ),
            stream=True,
        )
        async for chunk in response:
            yield chunk.text


def create_llm_provider(provider: str, api_key: str) -> LLMProvider:
    """Factory function — returns the correct provider"""
    match provider.lower():
        case "openai":
            return OpenAIProvider(api_key)
        case "anthropic":
            return AnthropicProvider(api_key)
        case "gemini":
            return GeminiProvider(api_key)
        case _:
            raise ValueError(f"Unknown LLM provider: {provider}")


# Academic writing system prompt template
ACADEMIC_SYSTEM_PROMPT = """Kamu adalah asisten penulisan akademik khusus untuk mahasiswa Indonesia.

PERANMU:
- Membantu menulis, mengedit, dan memformat dokumen akademik (skripsi, tesis, paper)
- Menggunakan bahasa Indonesia yang formal, objektif, dan akademik
- Mengikuti format sitasi {citation_style}

KONTEKS DOKUMEN AKTIF:
- Judul: {document_title}
- Bab/Bagian saat ini: {current_chapter}  
- Jumlah kata: {word_count} kata

REFERENSI TERSEDIA (gunakan HANYA ini untuk sitasi):
{available_citations}

ATURAN KETAT:
1. Gunakan placeholder [CITE:citeKey] untuk inline citation (contoh: [CITE:Smith2024])
2. JANGAN membuat sitasi fiktif — hanya gunakan referensi di atas
3. Jika diminta sitasi yang tidak ada di daftar, beritahu user bahwa referensi tidak ditemukan
4. Output dalam format Markdown yang bersih
5. Untuk heading: gunakan ## untuk BAB, ### untuk sub-bab (1.1, 1.2)
6. Tulis dengan nada ilmiah — tidak ada kata "saya" atau "kami" kecuali diminta

KONTEKS REFERENSI RAG:
{rag_context}
"""

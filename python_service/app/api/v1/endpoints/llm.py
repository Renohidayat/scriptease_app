"""
LLM Endpoint — Streaming completions via SSE
POST /api/v1/llm/stream
"""

from fastapi import APIRouter, HTTPException
from fastapi.responses import StreamingResponse
from pydantic import BaseModel
import json
from app.services.llm.llm_service import (
    create_llm_provider, ACADEMIC_SYSTEM_PROMPT
)

router = APIRouter()


class Message(BaseModel):
    role: str  # user | assistant
    content: str


class CitationContext(BaseModel):
    cite_key: str
    authors: list[str]
    year: int | None
    title: str
    apa_inline: str
    apa_full: str


class DocumentContext(BaseModel):
    document_title: str = "Untitled Document"
    current_chapter: str = "BAB I"
    word_count: int = 0
    citation_style: str = "APA"


class LlmStreamRequest(BaseModel):
    messages: list[Message]
    document_context: DocumentContext = DocumentContext()
    citation_context: list[CitationContext] = []
    rag_context: str = ""
    user_prompt: str
    provider: str = "openai"
    api_key: str
    model: str = "gpt-4o"
    temperature: float = 0.7
    max_tokens: int = 4096


@router.post("/stream")
async def stream_llm_response(request: LlmStreamRequest):
    """Stream LLM response as Server-Sent Events (SSE)"""
    
    # Build citations list for system prompt
    citations_text = "\n".join([
        f"- {c.cite_key}: {', '.join(c.authors[:2])} "
        f"({'et al.' if len(c.authors) > 2 else ''}) "
        f"({c.year}) — {c.title}"
        for c in request.citation_context
    ]) or "Tidak ada sitasi yang ditemukan."

    system = ACADEMIC_SYSTEM_PROMPT.format(
        citation_style=request.document_context.citation_style,
        document_title=request.document_context.document_title,
        current_chapter=request.document_context.current_chapter,
        word_count=request.document_context.word_count,
        available_citations=citations_text,
        rag_context=request.rag_context or "Tidak ada konteks RAG aktif.",
    )

    messages = [{"role": m.role, "content": m.content} for m in request.messages]
    messages.append({"role": "user", "content": request.user_prompt})

    provider = create_llm_provider(request.provider, request.api_key)

    async def event_generator():
        try:
            full_text = ""
            async for chunk in provider.stream(
                messages=messages,
                system=system,
                model=request.model,
                temperature=request.temperature,
                max_tokens=request.max_tokens,
            ):
                full_text += chunk
                data = json.dumps({"chunk": chunk, "done": False})
                yield f"data: {data}\n\n"
            
            # Send final event with complete text
            final = json.dumps({"chunk": "", "full_text": full_text, "done": True})
            yield f"data: {final}\n\n"
        
        except Exception as e:
            error = json.dumps({"error": str(e), "done": True})
            yield f"data: {error}\n\n"

    return StreamingResponse(
        event_generator(),
        media_type="text/event-stream",
        headers={
            "Cache-Control": "no-cache",
            "X-Accel-Buffering": "no",
        },
    )

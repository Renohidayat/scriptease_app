"""
LLM Service — Provider-agnostic streaming LLM client
Supports: OpenAI, Anthropic Claude, Google Gemini
"""

import asyncio
from abc import ABC, abstractmethod
from typing import AsyncGenerator
import openai
import anthropic
import google.generativeai as genai
from app.core.config import settings
from app.core.db import get_setting


class LLMProviderError(Exception):
    pass


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
        try:
            stream = await self.client.chat.completions.create(
                model=model,
                messages=full_messages,
                temperature=temperature,
                max_tokens=max_tokens,
                timeout=30.0,
                stream=True,
            )
            async for chunk in stream:
                if chunk.choices and chunk.choices[0].delta.content:
                    yield chunk.choices[0].delta.content
        except asyncio.CancelledError:
            raise
        except Exception as e:
            raise LLMProviderError(f"OpenAI Error: {str(e)}") from e


class AnthropicProvider(LLMProvider):
    def __init__(self, api_key: str):
        self.client = anthropic.AsyncAnthropic(api_key=api_key)

    async def stream(self, messages, system, model, temperature=0.7, max_tokens=4096):
        try:
            async with self.client.messages.stream(
                model=model,
                system=system,
                messages=messages,
                temperature=temperature,
                max_tokens=max_tokens,
                timeout=30.0,
            ) as stream:
                async for text in stream.text_stream:
                    yield text
        except asyncio.CancelledError:
            raise
        except Exception as e:
            raise LLMProviderError(f"Anthropic Error: {str(e)}") from e


class GeminiProvider(LLMProvider):
    def __init__(self, api_key: str):
        genai.configure(api_key=api_key)

    async def stream(self, messages, system, model, temperature=0.7, max_tokens=4096):
        genai_model = genai.GenerativeModel(
            model_name=model,
            system_instruction=system,
        )
        gemini_messages = [
            {"role": m["role"].replace("assistant", "model"),
             "parts": [m["content"]]}
            for m in messages
        ]
        try:
            response = await asyncio.wait_for(
                genai_model.generate_content_async(
                    gemini_messages,
                    generation_config=genai.GenerationConfig(
                        temperature=temperature,
                        max_output_tokens=max_tokens,
                    ),
                    stream=True,
                ),
                timeout=30.0,
            )
            async for chunk in response:
                if chunk.text:
                    yield chunk.text
        except asyncio.CancelledError:
            raise
        except Exception as e:
            raise LLMProviderError(f"Gemini Error: {str(e)}") from e


def create_llm_provider(provider: str | None = None) -> LLMProvider:
    """Factory function — returns the correct provider"""
    provider = (provider or get_setting("llm_provider", settings.LLM_PROVIDER)).lower()
    
    api_key = None
    if provider == "openai":
        api_key = settings.OPENAI_API_KEY
    elif provider == "anthropic":
        api_key = settings.ANTHROPIC_API_KEY
    elif provider == "gemini":
        api_key = settings.GEMINI_API_KEY

    if not api_key:
        raise LLMProviderError(f"API key missing for provider: {provider}")

    match provider:
        case "openai":
            return OpenAIProvider(api_key)
        case "anthropic":
            return AnthropicProvider(api_key)
        case "gemini":
            return GeminiProvider(api_key)
        case _:
            raise LLMProviderError(f"Unknown LLM provider: {provider}")


# Academic writing system prompt template
ACADEMIC_SYSTEM_PROMPT = """Kamu adalah asisten penulisan akademik tingkat lanjut khusus untuk mahasiswa Indonesia.

PERANMU:
- Membantu menulis, mengedit, dan memformat dokumen akademik (skripsi, tesis, paper, jurnal)
- Menggunakan bahasa Indonesia yang formal, objektif, dan baku sesuai EYD
- Menghasilkan struktur paragraf yang kohesif dan logis
- Mengikuti format sitasi {citation_style} secara ketat

KONTEKS DOKUMEN AKTIF:
- Judul: {document_title}
- Bab/Bagian saat ini: {current_chapter}  
- Jumlah kata saat ini: {word_count} kata

REFERENSI TERSEDIA (HANYA gunakan ini untuk sitasi, DILARANG KERAS membuat sitasi palsu/halusinasi):
{available_citations}

ATURAN KETAT OUTPUT (SANGAT PENTING):
1. Jika kamu perlu memasukkan referensi, gunakan HANYA placeholder format [CITE:citeKey] (contoh: [CITE:Smith2024]). 
2. Aplikasi klien (Flutter) akan mem-parse tag [CITE:...] tersebut menjadi format `{citation_style}` secara otomatis. Jangan tulis teks "(Smith, 2024)" manual, selalu gunakan tag!
3. DILARANG membuat sitasi fiktif. Jika user meminta data yang tidak ada di daftar referensi di atas, beritahu bahwa referensi tidak ditemukan di library.
4. Output harus dalam format Markdown yang bersih.
5. Untuk heading: gunakan ## untuk BAB, ### untuk sub-bab (contoh: 1.1 Latar Belakang).
6. Tulis dengan nada ilmiah orang ketiga (objektif) — tidak ada kata "saya", "kami", "kita" kecuali diminta eksplisit.

CHAIN-OF-THOUGHT (INSTRUKSI PROSES BERPIKIR):
Sebelum memberikan teks final yang diminta user, kamu HARUS terlebih dahulu membuat outline dan pemikiran internal yang dibungkus dalam tag <thought>...</thought>.
Di dalam tag tersebut:
1. Analisis tujuan penulisan berdasarkan request user.
2. Identifikasi referensi relevan dari data yang tersedia yang akan mendukung argumen.
3. Rencanakan struktur paragraf (ide pokok tiap paragraf).

Setelah tag <thought> ditutup, barulah berikan teks akademik final yang langsung bisa disalin oleh user ke editor teks mereka.

KONTEKS REFERENSI RAG (Pengetahuan Tambahan):
{rag_context}
"""

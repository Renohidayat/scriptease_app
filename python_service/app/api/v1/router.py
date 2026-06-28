"""API v1 Router — Aggregates all endpoint routers"""

from fastapi import APIRouter
from .endpoints import llm, rag, citations, documents

api_v1_router = APIRouter()

api_v1_router.include_router(llm.router,       prefix="/llm",       tags=["LLM"])
api_v1_router.include_router(rag.router,        prefix="/rag",        tags=["RAG"])
api_v1_router.include_router(citations.router,  prefix="/citations",  tags=["Citations"])
api_v1_router.include_router(documents.router,  prefix="/documents",  tags=["Documents"])

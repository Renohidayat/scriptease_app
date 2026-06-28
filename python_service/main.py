"""
AntiGravity WP — Python FastAPI Local Microservice
Runs on localhost:8765
Handles: LLM streaming, RAG pipeline, PDF processing, citation formatting
"""

import uvicorn
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from contextlib import asynccontextmanager
from app.api.v1.router import api_v1_router
from app.core.config import settings


@asynccontextmanager
async def lifespan(app: FastAPI):
    """Startup and shutdown events"""
    print(f"🚀 AntiGravity WP Service starting on port {settings.PORT}")
    print(f"📁 Data directory: {settings.DATA_DIR}")
    
    # Initialize ChromaDB collection on startup
    from app.services.rag.rag_service import RagService
    rag = RagService()
    await rag.initialize()
    print("✅ ChromaDB initialized")
    
    yield
    
    print("🛑 AntiGravity WP Service shutting down")


app = FastAPI(
    title="AntiGravity WP — Local AI Service",
    description="Local microservice for PDF processing, RAG, and LLM proxying",
    version="0.1.0",
    lifespan=lifespan,
    # Disable docs in production
    docs_url="/docs" if not settings.is_production else None,
)

# CORS: Only allow localhost connections
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:*", "http://127.0.0.1:*"],
    allow_methods=["GET", "POST", "PUT", "DELETE"],
    allow_headers=["*"],
)

app.include_router(api_v1_router, prefix="/api/v1")


@app.get("/health")
async def health_check():
    return {
        "status": "healthy",
        "service": "antigravity-wp-local",
        "version": "0.1.0"
    }


if __name__ == "__main__":
    uvicorn.run(
        "main:app",
        host="127.0.0.1",
        port=settings.PORT,
        reload=settings.DEBUG,
        log_level="info",
    )

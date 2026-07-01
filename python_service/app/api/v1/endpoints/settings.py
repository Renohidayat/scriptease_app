from fastapi import APIRouter
from pydantic import BaseModel
from app.core.config import settings
from app.core.db import get_setting, set_setting

router = APIRouter()

class SettingsUpdate(BaseModel):
    provider: str | None = None
    model: str | None = None
    api_key: str | None = None

@router.get("/")
def get_settings():
    provider = get_setting("llm_provider", settings.LLM_PROVIDER)
    
    api_key = ""
    if provider == "openai":
        api_key = settings.OPENAI_API_KEY
    elif provider == "anthropic":
        api_key = settings.ANTHROPIC_API_KEY
    elif provider == "gemini":
        api_key = settings.GEMINI_API_KEY
        
    masked_key = f"{api_key[:4]}...{api_key[-4:]}" if api_key and len(api_key) >= 8 else ("***" if api_key else "")
    
    return {
        "provider": provider,
        "model": get_setting("llm_model", settings.LLM_MODEL),
        "api_key": masked_key,
    }

@router.put("/")
def update_settings(update: SettingsUpdate):
    if update.provider is not None:
        set_setting("llm_provider", update.provider)
    if update.model is not None:
        set_setting("llm_model", update.model)
    # Intentionally ignoring update.api_key so it is not written to disk
        
    return {"status": "success"}

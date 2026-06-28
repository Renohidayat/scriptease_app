"""Application configuration via pydantic-settings"""

import os
from pathlib import Path
from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    # Service
    PORT: int = 8765
    DEBUG: bool = True
    
    # Paths
    DATA_DIR: Path = Path.home() / "AppData" / "Local" / "ScriptEaseApp"
    CHROMA_DIR: Path = DATA_DIR / "chroma_db"
    
    # LLM (overridden at runtime from Flutter settings)
    LLM_PROVIDER: str = "openai"
    LLM_API_KEY: str = ""
    LLM_MODEL: str = "gpt-4o"
    
    @property
    def is_production(self) -> bool:
        return not self.DEBUG
    
    def ensure_dirs(self):
        self.DATA_DIR.mkdir(parents=True, exist_ok=True)
        self.CHROMA_DIR.mkdir(parents=True, exist_ok=True)
    
    class Config:
        env_file = ".env"
        env_file_encoding = "utf-8"


settings = Settings()
settings.ensure_dirs()

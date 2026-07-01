"""Application configuration via pydantic-settings"""

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
    OPENAI_API_KEY: str = ""
    GEMINI_API_KEY: str = ""
    ANTHROPIC_API_KEY: str = ""
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
        extra = "ignore"


settings = Settings()
settings.ensure_dirs()

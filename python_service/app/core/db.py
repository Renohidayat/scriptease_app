import sqlite3
from app.core.config import settings

def get_db_connection() -> sqlite3.Connection:
    settings.ensure_dirs()
    db_path = settings.DATA_DIR / "app.sqlite"
    conn = sqlite3.connect(db_path, check_same_thread=False)
    conn.execute('''
        CREATE TABLE IF NOT EXISTS app_settings (
            key TEXT PRIMARY KEY,
            value TEXT NOT NULL
        )
    ''')
    conn.commit()
    return conn

def get_setting(key: str, default: str) -> str:
    with get_db_connection() as conn:
        cursor = conn.execute("SELECT value FROM app_settings WHERE key = ?", (key,))
        row = cursor.fetchone()
        return row[0] if row else default

def set_setting(key: str, value: str):
    with get_db_connection() as conn:
        conn.execute(
            "INSERT INTO app_settings (key, value) VALUES (?, ?) ON CONFLICT(key) DO UPDATE SET value = excluded.value",
            (key, value)
        )

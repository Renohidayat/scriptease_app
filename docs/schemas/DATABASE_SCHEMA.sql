-- ════════════════════════════════════════════════════════════════════
-- AntiGravity WP — SQLite Database Schema
-- Generated for documentation purposes
-- Actual implementation: Drift ORM in flutter_app/lib/core/database/
-- ════════════════════════════════════════════════════════════════════

PRAGMA foreign_keys = ON;
PRAGMA journal_mode = WAL;  -- Write-Ahead Logging for better concurrency

-- ── 1. DOCUMENTS ──────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS documents (
    id                  INTEGER PRIMARY KEY AUTOINCREMENT,
    title               TEXT NOT NULL CHECK(length(title) BETWEEN 1 AND 500),
    file_path           TEXT,                          -- NULL if only in DB
    content_delta       TEXT NOT NULL DEFAULT '[]',   -- Quill Delta JSON
    content_plain_text  TEXT NOT NULL DEFAULT '',      -- For word count & search
    word_count          INTEGER NOT NULL DEFAULT 0,
    citation_style      TEXT NOT NULL DEFAULT 'APA'
                        CHECK(citation_style IN ('APA','IEEE','Chicago','Indonesia')),
    academic_format     TEXT NOT NULL DEFAULT 'SKRIPSI'
                        CHECK(academic_format IN ('SKRIPSI','TESIS','DISERTASI','PAPER','MAKALAH')),
    is_deleted          INTEGER NOT NULL DEFAULT 0,    -- Soft delete
    created_at          TEXT NOT NULL DEFAULT (datetime('now')),
    updated_at          TEXT NOT NULL DEFAULT (datetime('now')),
    last_opened_at      TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX idx_documents_updated ON documents(updated_at DESC);
CREATE INDEX idx_documents_not_deleted ON documents(is_deleted) WHERE is_deleted = 0;

-- Sample data
INSERT INTO documents (title, content_plain_text, word_count, citation_style, academic_format)
VALUES
    ('Skripsi: Implementasi Machine Learning untuk Deteksi Dini Penyakit Jantung', '', 0, 'APA', 'SKRIPSI'),
    ('Paper: Analisis Sentimen Media Sosial Menggunakan BERT', '', 0, 'IEEE', 'PAPER'),
    ('Tesis: Optimasi Algoritma Genetika pada Penjadwalan Produksi', '', 0, 'APA', 'TESIS');

-- ── 2. CHAT_HISTORY ───────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS chat_history_entries (
    id                  INTEGER PRIMARY KEY AUTOINCREMENT,
    document_id         INTEGER NOT NULL
                        REFERENCES documents(id) ON DELETE CASCADE,
    session_id          TEXT NOT NULL,                 -- UUID per chat session
    role                TEXT NOT NULL
                        CHECK(role IN ('user','assistant','system')),
    content             TEXT NOT NULL,
    token_count_input   INTEGER NOT NULL DEFAULT 0,
    token_count_output  INTEGER NOT NULL DEFAULT 0,
    llm_provider        TEXT,                          -- openai|gemini|anthropic
    llm_model           TEXT,                          -- gpt-4o|claude-3-5-sonnet|etc
    latency_ms          INTEGER,                       -- Response time in milliseconds
    created_at          TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX idx_chat_document ON chat_history_entries(document_id, created_at DESC);
CREATE INDEX idx_chat_session  ON chat_history_entries(session_id);

-- ── 3. PROMPT_TEMPLATES ───────────────────────────────────────────

CREATE TABLE IF NOT EXISTS prompt_templates (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    name            TEXT NOT NULL UNIQUE,
    category        TEXT NOT NULL
                    CHECK(category IN ('writing','citation','format','analysis','revision')),
    template_text   TEXT NOT NULL,
    variables_json  TEXT NOT NULL DEFAULT '[]',        -- ["var1","var2"]
    usage_count     INTEGER NOT NULL DEFAULT 0,
    is_system       INTEGER NOT NULL DEFAULT 0,        -- 1=built-in, 0=user-created
    created_at      TEXT NOT NULL DEFAULT (datetime('now')),
    updated_at      TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX idx_templates_category ON prompt_templates(category);

-- Sample templates
INSERT INTO prompt_templates (name, category, template_text, variables_json, is_system)
VALUES
    (
        'Tulis Pendahuluan Bab',
        'writing',
        'Tulis pendahuluan untuk {{chapter_name}} skripsi saya berjudul "{{document_title}}". Latar belakang masalah, rumusan masalah, tujuan, dan manfaat. Panjang sekitar {{word_count}} kata.',
        '["chapter_name","document_title","word_count"]',
        1
    ),
    (
        'Cari & Masukkan Sitasi',
        'citation',
        'Cari referensi {{author}} {{year}} di library Zotero saya dan masukkan inline citation format {{citation_style}}.',
        '["author","year","citation_style"]',
        1
    ),
    (
        'Buat Abstrak Bilingual',
        'writing',
        'Buat abstrak Indonesia dan Inggris untuk dokumen ini. Maksimal 250 kata per bahasa. Sertakan: tujuan, metode, hasil, kesimpulan.',
        '[]',
        1
    );

-- ── 4. CITATION_CACHE ─────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS citation_cache (
    id                  INTEGER PRIMARY KEY AUTOINCREMENT,
    source              TEXT NOT NULL
                        CHECK(source IN ('zotero','mendeley','manual')),
    external_id         TEXT NOT NULL,                 -- Zotero item key or Mendeley ID
    cite_key            TEXT NOT NULL UNIQUE,          -- e.g. "Smith2024NeuralPlasticity"
    title               TEXT NOT NULL,
    authors_json        TEXT NOT NULL DEFAULT '[]',    -- ["Smith, J.", "Doe, A."]
    year                INTEGER,
    journal             TEXT,
    volume              TEXT,
    issue               TEXT,
    pages               TEXT,
    doi                 TEXT,
    url                 TEXT,
    -- Pre-formatted strings for performance
    apa_formatted       TEXT,                          -- Full APA 7th reference
    ieee_formatted      TEXT,                          -- Full IEEE reference
    chicago_formatted   TEXT,                          -- Full Chicago 17th reference
    indonesia_formatted TEXT,                          -- Indonesian Depdiknas style
    raw_json            TEXT NOT NULL DEFAULT '{}',   -- Original source data
    last_synced_at      TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX idx_citation_cite_key ON citation_cache(cite_key);
CREATE INDEX idx_citation_year     ON citation_cache(year DESC);
CREATE INDEX idx_citation_source   ON citation_cache(source);

-- Sample data
INSERT INTO citation_cache 
    (source, external_id, cite_key, title, authors_json, year, journal, doi, apa_formatted, ieee_formatted, raw_json)
VALUES
    (
        'zotero', 'ZOTERO_ABC123', 'Smith2024DeepLearning',
        'Deep Learning Applications in Medical Diagnosis',
        '["Smith, J. A.", "Johnson, B. C."]',
        2024, 'Nature Medicine', '10.1038/s41591-024-0001',
        'Smith, J. A., & Johnson, B. C. (2024). Deep Learning Applications in Medical Diagnosis. Nature Medicine, 30(2), 145–167. https://doi.org/10.1038/s41591-024-0001',
        '[1] J. A. Smith and B. C. Johnson, "Deep Learning Applications in Medical Diagnosis," Nature Medicine, vol. 30, no. 2, pp. 145–167, 2024.',
        '{}'
    );

-- ── 5. RAG_INDEX_METADATA ─────────────────────────────────────────

CREATE TABLE IF NOT EXISTS rag_index_metadata (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    file_path       TEXT NOT NULL UNIQUE,
    file_name       TEXT NOT NULL,
    file_hash       TEXT NOT NULL,                 -- SHA-256 for dedup detection
    file_size_bytes INTEGER NOT NULL,
    page_count      INTEGER,
    chunk_count     INTEGER,
    collection_name TEXT NOT NULL DEFAULT 'references',
    index_status    TEXT NOT NULL DEFAULT 'pending'
                    CHECK(index_status IN ('pending','processing','completed','failed')),
    error_message   TEXT,
    indexed_at      TEXT,
    created_at      TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX idx_rag_status ON rag_index_metadata(index_status);
CREATE INDEX idx_rag_hash   ON rag_index_metadata(file_hash);

-- ── 6. APP_SETTINGS ───────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS app_settings (
    key         TEXT PRIMARY KEY,
    value       TEXT NOT NULL,
    value_type  TEXT NOT NULL DEFAULT 'string'
                CHECK(value_type IN ('string','int','bool','json')),
    description TEXT,
    updated_at  TEXT NOT NULL DEFAULT (datetime('now'))
);

-- Default settings
INSERT OR IGNORE INTO app_settings (key, value, value_type, description) VALUES
    ('llm_provider',             'openai',     'string', 'LLM provider: openai|gemini|anthropic'),
    ('llm_api_key_encrypted',    '',           'string', 'Encrypted API key (Windows DPAPI)'),
    ('llm_model',                'gpt-4o',     'string', 'Model name for selected provider'),
    ('llm_temperature',          '0.7',        'string', 'Creativity level 0.0-1.0'),
    ('llm_max_tokens',           '4096',       'int',    'Max output tokens per request'),
    ('default_citation_style',   'APA',        'string', 'Default: APA|IEEE|Chicago|Indonesia'),
    ('zotero_db_path',           '',           'string', 'Custom path to zotero.sqlite (empty=auto)'),
    ('mendeley_access_token',    '',           'string', 'Mendeley OAuth2 access token'),
    ('theme_mode',               'system',     'string', 'Theme: light|dark|system'),
    ('auto_save_interval_secs',  '30',         'int',    'Auto-save interval in seconds'),
    ('rag_enabled',              'true',       'bool',   'Inject RAG context into AI prompts'),
    ('rag_top_k',                '5',          'int',    'Number of RAG chunks to retrieve'),
    ('python_service_port',      '8765',       'int',    'Local FastAPI service port'),
    ('python_service_autostart', 'true',       'bool',   'Auto-start Python service with app'),
    ('editor_font_family',       'Times New Roman', 'string', 'Editor font'),
    ('editor_font_size',         '12',         'int',    'Editor font size in pt'),
    ('editor_line_spacing',      '2.0',        'string', 'Line spacing multiplier');

-- ── 7. DOCUMENT_CITATIONS ─────────────────────────────────────────

CREATE TABLE IF NOT EXISTS document_citations (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    document_id     INTEGER NOT NULL
                    REFERENCES documents(id) ON DELETE CASCADE,
    citation_id     INTEGER NOT NULL
                    REFERENCES citation_cache(id) ON DELETE CASCADE,
    position_index  INTEGER NOT NULL DEFAULT 0,    -- Order in bibliography
    inline_count    INTEGER NOT NULL DEFAULT 1,    -- Times cited in text body
    inserted_at     TEXT NOT NULL DEFAULT (datetime('now')),
    UNIQUE(document_id, citation_id)
);

CREATE INDEX idx_doc_citations_doc ON document_citations(document_id, position_index);

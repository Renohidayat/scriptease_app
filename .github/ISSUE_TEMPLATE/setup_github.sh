#!/usr/bin/env bash
# ═══════════════════════════════════════════════════════════════════════
#  AntiGravity WP — GitHub CLI Auto-Setup & Sync Script
#  Setiap aksi OTOMATIS di-push ke GitHub
# ═══════════════════════════════════════════════════════════════════════
#
#  CARA PAKAI:
#  1. Buat GitHub Personal Access Token (PAT) di:
#     https://github.com/settings/tokens/new
#     Centang: repo, workflow, read:org
#
#  2. Jalankan:
#     export GITHUB_TOKEN="ghp_your_token_here"
#     export GITHUB_USERNAME="your_username"
#     bash setup_github.sh
#
# ═══════════════════════════════════════════════════════════════════════

set -euo pipefail

# ─── CONFIG ────────────────────────────────────────────────────────────
REPO_NAME="antigravity-wp"
REPO_DESC="⚡ AntiGravity WP — AI-Powered Academic Word Processor for Windows. Defying the gravity of thesis writing."
REPO_VISIBILITY="public"  # public atau private

# Colors
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

log()     { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[✅ OK]${NC} $1"; }
warn()    { echo -e "${YELLOW}[⚠️  WARN]${NC} $1"; }
error()   { echo -e "${RED}[❌ ERROR]${NC} $1"; exit 1; }
step()    { echo -e "\n${BOLD}${CYAN}══ STEP: $1 ══${NC}"; }

# ─── AUTO GITHUB PUSH FUNCTION ─────────────────────────────────────────
# Dipanggil setelah SETIAP aksi penting untuk auto-commit & push
auto_push() {
    local message="$1"
    local scope="${2:-chore}"
    
    cd "$PROJECT_DIR"
    
    git add -A
    
    if git diff --staged --quiet; then
        log "No changes to commit for: $message"
        return 0
    fi
    
    git commit -m "${scope}: ${message}

🤖 Auto-committed by setup_github.sh
📅 $(date '+%Y-%m-%d %H:%M:%S')
🔧 AntiGravity WP Setup Pipeline"
    
    git push origin main --quiet
    success "Auto-pushed: $message"
}

# ─── PRE-FLIGHT CHECKS ─────────────────────────────────────────────────
step "Pre-flight Checks"

[[ -z "${GITHUB_TOKEN:-}" ]] && error "GITHUB_TOKEN tidak di-set!\nJalankan: export GITHUB_TOKEN='ghp_xxxxx'"
[[ -z "${GITHUB_USERNAME:-}" ]] && error "GITHUB_USERNAME tidak di-set!\nJalankan: export GITHUB_USERNAME='your_username'"

command -v gh   >/dev/null 2>&1 || error "GitHub CLI (gh) tidak terinstall"
command -v git  >/dev/null 2>&1 || error "git tidak terinstall"
command -v jq   >/dev/null 2>&1 || error "jq tidak terinstall. Install: apt install jq / brew install jq"

# Authenticate gh CLI
echo "$GITHUB_TOKEN" | gh auth login --with-token 2>/dev/null || true
gh auth status >/dev/null 2>&1 || error "GitHub authentication gagal. Cek token kamu."

success "All prerequisites met!"
log "User: $(gh api user --jq '.login')"

# ─── STEP 1: INIT LOCAL PROJECT ──────────────────────────────────────
step "1 — Initialize Local Project Structure"

PROJECT_DIR="$(pwd)/${REPO_NAME}"
[[ -d "$PROJECT_DIR" ]] && warn "Direktori $PROJECT_DIR sudah ada, skip creation"

mkdir -p "${PROJECT_DIR}"/{docs/{architecture,schemas,flows,guides},flutter_app/{lib/{core/{database/{dao,migrations},services/{llm,citation,rag,document,filesystem},models,utils,di},features/{editor/{bloc,widgets,models,services},ai_chat/{bloc,widgets,models},citations/{bloc,widgets,models,services},document_manager/{bloc,widgets,models},settings/{bloc,widgets}},shared/{widgets,theme,constants,extensions}},windows/runner,assets/{fonts,icons,lottie},test},python_service/{app/{api/{v1/endpoints,middleware,deps},core,services/{llm,citation,rag,document,vector},models/{request,response,domain},utils},tests/{unit,integration},scripts},scripts,github_setup}

cd "$PROJECT_DIR"
success "Project directories created ($(find . -type d | wc -l) dirs)"

# ─── STEP 2: GIT INIT ────────────────────────────────────────────────
step "2 — Initialize Git Repository"

git init -q
git config user.email "dev@antigravity-wp.local"
git config user.name "AntiGravity WP Bot"

# .gitignore
cat > .gitignore << 'GITIGNORE'
# Flutter
flutter_app/.dart_tool/
flutter_app/.flutter-plugins
flutter_app/.flutter-plugins-dependencies
flutter_app/build/
flutter_app/*.g.dart
flutter_app/*.freezed.dart
flutter_app/pubspec.lock
flutter_app/windows/flutter/generated_plugin_registrant.cc
flutter_app/windows/flutter/generated_plugins.cmake

# Python
python_service/__pycache__/
python_service/**/__pycache__/
python_service/.venv/
python_service/venv/
python_service/*.egg-info/
python_service/.pytest_cache/
python_service/chroma_data/
python_service/.env

# Secrets & Keys
*.env
.env.*
api_keys.json
secrets.json

# OS
.DS_Store
Thumbs.db
desktop.ini

# IDE
.vscode/settings.json
.idea/
*.swp

# Build outputs
*.exe
*.dll
*.so
dist/
build/

# Database files (user data)
*.sqlite
*.db
!*_schema.sql
GITIGNORE

auto_push "Initialize repository with .gitignore" "chore"

# ─── STEP 3: CREATE README ────────────────────────────────────────────
step "3 — Create Project README"

cat > README.md << 'EOREADME'
# ⚡ AntiGravity WP

> **Defy the gravity of academic writing — write, cite, and publish at the speed of thought.**

[![Flutter Windows](https://img.shields.io/badge/Flutter-Windows-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Python FastAPI](https://img.shields.io/badge/Python-FastAPI-009688?logo=fastapi&logoColor=white)](https://fastapi.tiangolo.com)
[![Status](https://img.shields.io/badge/Status-Active%20Dev-orange)](https://github.com/GITHUB_USERNAME/antigravity-wp/issues)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

AntiGravity WP is an **AI-powered academic word processor** for Windows — a Microsoft Word alternative built specifically for Indonesian students and researchers writing skripsi, tesis, and disertasi.

## 🚫 The Problem (4 Gravitational Forces)

| Force | Pain Point | Our Solution |
|-------|-----------|--------------|
| ⬇️ Context Switching | Word → Zotero → ChatGPT → back to Word | One unified workspace |
| ⬇️ Manual Formatting | APA/IEEE rules interrupt writing flow | AI auto-formats in real-time |
| ⬇️ Cloud Dependency | Research data on third-party servers | 100% local-first architecture |
| ⬇️ Generic AI | ChatGPT doesn't know your document | Context-aware AI with full doc access |

## ✨ Key Features

- **Split-screen AI Canvas** — Editor (left) + AI chat (right), always in sync
- **Smart Citation Engine** — Direct Zotero SQLite parsing, auto-bibliography
- **RAG Research Assistant** — Index your PDF library, query it semantically
- **Academic Formatter** — APA 7th, IEEE, Chicago, Indonesian university styles
- **Local .docx/.pdf Export** — No cloud, no subscription, your files

## 🏗️ Architecture

```
Flutter Windows App (UI + State)
    ↕ HTTP/SSE (localhost:8765)
Python FastAPI Service (RAG + LLM + PDF)
    ↕ SQL queries
SQLite (App data) + ChromaDB (Vector) + Zotero.sqlite (Citations)
    ↕ API calls
LLM APIs (OpenAI / Gemini / Anthropic) — only when needed
```

## 🚀 Quick Start

```bash
# Requirements: Flutter 3.22+, Python 3.11+, Windows 10/11

git clone https://github.com/GITHUB_USERNAME/antigravity-wp.git
cd antigravity-wp

# Flutter
cd flutter_app && flutter pub get && flutter run -d windows

# Python service (separate terminal)
cd python_service && pip install -r requirements.txt && python main.py
```

## 📋 Roadmap

See [Issues](../../issues) and [Milestones](../../milestones) for the full development plan.

| Milestone | Status | Target |
|-----------|--------|--------|
| M0: Repository Bootstrap | 🔄 In Progress | Week 1 |
| M1: Core Database & Models | 📋 Planned | Week 2 |
| M2: Editor Canvas | 📋 Planned | Week 3-4 |
| M3: Citation Engine | 📋 Planned | Week 5-6 |
| M4: RAG Pipeline | 📋 Planned | Week 7-8 |
| M5: Document Export | 📋 Planned | Week 9 |
| M6: LLM Integration | 📋 Planned | Week 10 |

## 📄 License

MIT — See [LICENSE](LICENSE)
EOREADME

sed -i "s/GITHUB_USERNAME/${GITHUB_USERNAME}/g" README.md

auto_push "Add comprehensive README with architecture overview" "docs"

# ─── STEP 4: CORE DOCS ───────────────────────────────────────────────
step "4 — Generate Architecture Documentation"

# Architecture diagram
cat > docs/architecture/SYSTEM_ARCHITECTURE.md << 'EOARCH'
# AntiGravity WP — System Architecture

## High-Level Architecture Diagram

```mermaid
graph TB
    subgraph FLUTTER["🖥️ Flutter Windows App"]
        direction TB
        UI["Split-Screen UI<br/>(Editor + AI Chat)"]
        BLOC["BLoC State Layer<br/>(editor_bloc, chat_bloc,<br/>citation_bloc, doc_bloc)"]
        DRIFT["Drift SQLite Client<br/>(documents, chat_history,<br/>citation_cache, settings)"]
        ZOTERO_SVC["ZoteroDbService<br/>(sqflite_common_ffi)"]
    end

    subgraph PYTHON["🐍 Python FastAPI (localhost:8765)"]
        direction TB
        API["REST API Router<br/>/v1/llm /v1/rag<br/>/v1/citations /v1/documents"]
        LLM_SVC["LLM Service<br/>(OpenAI/Gemini/Anthropic)"]
        RAG_SVC["RAG Service<br/>(ChromaDB + Embeddings)"]
        DOC_SVC["Document Service<br/>(python-docx, PyMuPDF)"]
        CITE_SVC["Citation Formatter<br/>(APA/IEEE/Indonesia)"]
    end

    subgraph LOCAL_STORAGE["💾 Local Storage"]
        SQLITE["app.sqlite<br/>(Drift managed)"]
        CHROMA["ChromaDB<br/>(Vector Store)"]
        ZOTERO_DB["zotero.sqlite<br/>(Read-Only)"]
        FS["Windows File System<br/>(.docx, .pdf, reference PDFs)"]
    end

    subgraph EXTERNAL["🌐 External Services"]
        LLM_API["LLM APIs<br/>(OpenAI/Gemini/Anthropic)"]
        MENDELEY["Mendeley REST API<br/>(OAuth2, optional)"]
    end

    %% Flutter internal
    UI --> BLOC
    BLOC --> DRIFT
    BLOC --> ZOTERO_SVC

    %% Flutter to Python (HTTP)
    BLOC -->|"POST /llm/stream (SSE)"| API
    BLOC -->|"POST /rag/query"| API
    BLOC -->|"POST /citations/format"| API
    BLOC -->|"POST /documents/export"| API

    %% Python internal
    API --> LLM_SVC
    API --> RAG_SVC
    API --> DOC_SVC
    API --> CITE_SVC

    %% Storage connections
    DRIFT --> SQLITE
    RAG_SVC --> CHROMA
    ZOTERO_SVC --> ZOTERO_DB
    DOC_SVC --> FS

    %% External
    LLM_SVC -->|"API calls (when online)"| LLM_API
    CITE_SVC -->|"OAuth2 sync (optional)"| MENDELEY

    classDef flutter fill:#02569B,color:#fff,stroke:#01376A
    classDef python fill:#009688,color:#fff,stroke:#007166
    classDef storage fill:#795548,color:#fff,stroke:#5D4037
    classDef external fill:#E65100,color:#fff,stroke:#BF360C

    class UI,BLOC,DRIFT,ZOTERO_SVC flutter
    class API,LLM_SVC,RAG_SVC,DOC_SVC,CITE_SVC python
    class SQLITE,CHROMA,ZOTERO_DB,FS storage
    class LLM_API,MENDELEY external
```

## Component Responsibility Matrix

| Component | Technology | Responsibility | Communicates With |
|-----------|-----------|---------------|-------------------|
| Editor Canvas | flutter_quill + custom embeds | Rich text editing, citation embeds, auto-save | BLoC, Drift |
| AI Chat Panel | Flutter widgets + SSE stream | Display AI response, stream render, insert action | ChatBloc, PythonClient |
| CitationBloc | flutter_bloc | Citation search, format selection, insert trigger | ZoteroDbService, PythonClient |
| EditorBloc | flutter_bloc | Document state, Delta ops, word count | Drift, QuillController |
| Drift SQLite | drift + sqlite3_flutter_libs | Persist all app data | Flutter app |
| ZoteroDbService | sqflite_common_ffi | Read zotero.sqlite directly | zotero.sqlite |
| FastAPI Service | Python + Uvicorn | Heavy processing: PDF, RAG, LLM proxy | ChromaDB, LLM APIs |
| RAG Service | ChromaDB + sentence-transformers | Index PDFs, semantic search, context retrieval | ChromaDB |
| LLM Service | openai SDK (multi-provider) | Stream completions, token counting | External LLM APIs |
| Document Service | python-docx, PyMuPDF, WeasyPrint | Parse .docx, export .docx/.pdf | File system |
| Citation Formatter | Pure Python | Format APA/IEEE/Indonesia strings | Called by Citation API |
```
EOARCH

auto_push "Add Mermaid system architecture diagram" "docs"

# Data flow docs
cat > docs/flows/CITATION_DATA_FLOW.md << 'EOFLOW'
# Data Flow: "Tulis Bab 1 dan sitir Smith 2024"

## Complete Step-by-Step Flow

```
[STEP 1] USER → AI Chat Panel
  Input:   Ketik "Tulis Bab 1 dan sitir Smith 2024" + Enter
  Proses:  Flutter capture text input
  Output:  ChatMessageEvent dispatched ke ChatBloc
  Latency: <1ms (local UI)

[STEP 2] ChatBloc → EditorBloc
  Input:   GetDocumentContextEvent
  Proses:  QuillController.document.toPlainText()
           Ambil title, current_chapter, word_count dari state
  Output:  DocumentContext object
  Latency: <5ms (local memory)

[STEP 3] ChatBloc → ZoteroDbService (PARALLEL dengan Step 4)
  Input:   query = "Smith 2024"
           zotero_db_path = "C:\Users\<User>\Zotero\zotero.sqlite"
  Proses:  Parse "Smith" sebagai author, "2024" sebagai year
           Execute SQL query ke zotero.sqlite (READ-ONLY)
           Map result → Citation model
  Output:  List<Citation> (mungkin kosong jika tidak ketemu)
  Latency: 10–50ms (local SQLite)

  IF citation NOT FOUND in Zotero:
    → Cek citation_cache di app.sqlite
    → Fallback: POST /api/v1/citations/search ke Python
    → Python cek Mendeley API (jika configured)
    → Return empty jika semua tidak ketemu + warning ke user

[STEP 4] Flutter → Python FastAPI
  Endpoint: POST http://localhost:8765/api/v1/llm/stream
  Input:
    {
      "messages": [...chat_history...],
      "system_context": {
        "document_title": "Skripsi: Analisis ...",
        "current_chapter": "BAB I",
        "word_count": 1250,
        "citation_style": "APA"
      },
      "citation_context": {
        "found_citations": [
          {
            "cite_key": "Smith2024",
            "authors": ["Smith, J."],
            "year": 2024,
            "title": "Deep Learning for...",
            "journal": "Nature AI",
            "apa_inline": "(Smith, 2024)",
            "apa_full": "Smith, J. (2024). Deep Learning..."
          }
        ]
      },
      "user_prompt": "Tulis Bab 1 dan sitir Smith 2024",
      "model": "gpt-4o",
      "stream": true
    }
  Latency: <100ms (local HTTP, no network yet)

[STEP 5] Python FastAPI → Build System Prompt
  Input:   Request dari Step 4
  Proses:
    1. Load ACADEMIC_SYSTEM_PROMPT template
    2. Inject: citation_style, document_context, available_citations
    3. Apply RAG context jika ada PDF references di-index
    4. Build messages array untuk LLM
  Output:  Structured messages array + system prompt
  Latency: <10ms

[STEP 6] Python → LLM API (NETWORK CALL)
  Input:   Messages array dengan full context
  Proses:  openai.chat.completions.create(stream=True)
  Output:  Async generator of text chunks
           LLM menggunakan [CITE:Smith2024] placeholder
  Latency: 1–5 detik (first token), tergantung API

[STEP 7] Python → Flutter (STREAMING via SSE)
  Format:  Server-Sent Events
           data: {"chunk": "Bab I menjelaskan...", "done": false}
           data: {"chunk": "[CITE:Smith2024]", "done": false}
           data: {"full_text": "...", "done": true}
  Proses:  Flutter StreamController receive chunks
           Real-time append ke ChatMessage widget
  Latency: Per chunk: <10ms (local network)

[STEP 8] Flutter ChatBloc → Parse Citation Placeholders
  Input:   Full LLM response text
  Proses:  Regex scan untuk [CITE:xxxxx] patterns
           Lookup setiap cite_key di citation_context
           Prepare CitationEmbed objects
  Output:  ProcessedLlmResponse dengan citation maps
  Latency: <5ms

[STEP 9] USER → Click "Insert to Document"
  Input:   Klik button di AI Chat Panel
  Proses:  InsertToDocumentEvent dispatched
  Latency: <1ms (user action)

[STEP 10] EditorBloc → QuillController (WRITE TO EDITOR)
  Input:   ProcessedLlmResponse
  Proses:
    a) Convert Markdown → Quill Delta operations
    b) Replace [CITE:Smith2024] dengan CitationEmbed object:
       {insert: {citation: {citeKey:"Smith2024", display:"(Smith, 2024)", ...}}}
    c) Apply Delta ke QuillController.document
    d) Scroll editor ke posisi insert
  Output:  Teks BAB I muncul di editor dengan inline citation chip
  Latency: <50ms

[STEP 11] EditorBloc → Update Bibliography Section
  Input:   CitationEmbed yang di-insert (Smith2024)
  Proses:
    a) Check apakah Smith2024 sudah ada di Daftar Pustaka
    b) Jika belum: tambahkan di akhir dokumen
       Gunakan citation.apa_full sebagai string
    c) Jika IEEE: re-number semua citations
    d) Update document_citations junction table di SQLite
  Output:  Daftar Pustaka section ter-update
  Latency: <30ms

[STEP 12] EditorBloc → Auto-Save
  Input:   Updated document Delta
  Proses:  Drift update documents table
           content_delta = quillController.document.toDelta().toJson()
           word_count = updated count
           updated_at = DateTime.now()
  Output:  Dokumen tersimpan ke SQLite
  Latency: <20ms

══════════════════════════════════════════════════════
TOTAL LATENCY ESTIMATE:
  - Dari user ketik Enter → streaming start: ~2–6 detik
  - Streaming duration: 5–15 detik (tergantung panjang bab)
  - Insert + bibliography update: <100ms
══════════════════════════════════════════════════════
```
EOFLOW

auto_push "Add detailed citation data flow documentation" "docs"

# ─── STEP 5: FLUTTER CORE FILES ──────────────────────────────────────
step "5 — Generate Flutter Core Implementation Files"

# pubspec.yaml
cat > flutter_app/pubspec.yaml << 'EOPUBSPEC'
name: antigravity_wp
description: "AntiGravity WP — AI-Powered Academic Word Processor for Windows"
publish_to: 'none'
version: 0.1.0+1

environment:
  sdk: '>=3.4.0 <4.0.0'
  flutter: ">=3.22.0"

dependencies:
  flutter:
    sdk: flutter

  # Rich Text Editor
  flutter_quill: ^10.8.3

  # State Management
  flutter_bloc: ^8.1.6
  equatable: ^2.0.5

  # Dependency Injection
  get_it: ^7.7.0
  injectable: ^2.4.2

  # Navigation
  go_router: ^14.2.0

  # Database
  drift: ^2.20.2
  sqlite3_flutter_libs: ^0.5.24
  sqflite_common_ffi: ^2.3.3    # For Zotero direct access on Windows

  # Code Generation Helpers
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0

  # Networking
  dio: ^5.5.0+1
  http: ^1.2.1

  # File Management
  path_provider: ^2.1.3
  path: ^1.9.0
  file_picker: ^8.1.2
  desktop_drop: ^0.4.4

  # Caching
  hive_flutter: ^1.1.0

  # UI Utilities
  window_manager: ^0.3.9
  split_view: ^3.2.2
  lottie: ^3.1.2
  shimmer: ^3.0.0
  intl: ^0.19.0

dev_dependencies:
  flutter_test:
    sdk: flutter

  # Code Generation
  build_runner: ^2.4.11
  drift_dev: ^2.20.2
  injectable_generator: ^2.6.2
  freezed: ^2.5.7
  json_serializable: ^6.8.0

  # Testing
  bloc_test: ^9.1.7
  mocktail: ^1.0.4

  # Linting
  flutter_lints: ^4.0.0

flutter:
  uses-material-design: true
  assets:
    - assets/icons/
    - assets/lottie/
EOPUBSPEC

auto_push "Add Flutter pubspec.yaml with all dependencies" "chore"

# Main app database
mkdir -p flutter_app/lib/core/database
cat > flutter_app/lib/core/database/app_database.dart << 'EODB'
// ═══════════════════════════════════════════════════════════════════
// app_database.dart — AntiGravity WP Local SQLite Database
// Uses Drift for type-safe, reactive SQLite access
// ═══════════════════════════════════════════════════════════════════

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dao/documents_dao.dart';
import 'dao/chat_history_dao.dart';
import 'dao/citations_dao.dart';
import 'dao/settings_dao.dart';

part 'app_database.g.dart';

// ── TABLE DEFINITIONS ────────────────────────────────────────────

/// Stores user's academic documents
class Documents extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 500)();
  TextColumn get filePath => text().nullable()();
  TextColumn get contentDelta => text().withDefault(const Constant('[]'))();
  TextColumn get contentPlainText => text().withDefault(const Constant(''))();
  IntColumn get wordCount => integer().withDefault(const Constant(0))();
  TextColumn get citationStyle =>
      text().withDefault(const Constant('APA'))(); // APA|IEEE|Chicago|Indonesia
  TextColumn get academicFormat =>
      text().withDefault(const Constant('SKRIPSI'))(); // SKRIPSI|TESIS|PAPER
  BoolColumn get isDeleted =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastOpenedAt =>
      dateTime().withDefault(currentDateAndTime)();
}

/// AI chat messages per document session
class ChatHistoryEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get documentId =>
      integer().references(Documents, #id, onDelete: KeyAction.cascade)();
  TextColumn get sessionId => text()();
  TextColumn get role => text()(); // user | assistant | system
  TextColumn get content => text()();
  IntColumn get tokenCountInput =>
      integer().withDefault(const Constant(0))();
  IntColumn get tokenCountOutput =>
      integer().withDefault(const Constant(0))();
  TextColumn get llmProvider => text().nullable()(); // openai|gemini|anthropic
  TextColumn get llmModel => text().nullable()();
  IntColumn get latencyMs => integer().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}

/// Reusable prompt templates (system + user)
class PromptTemplates extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 200)();
  TextColumn get category =>
      text()(); // writing|citation|format|analysis|revision
  TextColumn get templateText => text()();
  TextColumn get variablesJson =>
      text().withDefault(const Constant('[]'))(); // ["title","chapter",...]
  IntColumn get usageCount => integer().withDefault(const Constant(0))();
  BoolColumn get isSystem =>
      boolean().withDefault(const Constant(false))(); // built-in vs user
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
}

/// Cache of citations from Zotero/Mendeley to avoid repeated DB reads
class CitationCache extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get source => text()(); // zotero | mendeley | manual
  TextColumn get externalId => text()();
  TextColumn get citeKey => text().unique()();
  TextColumn get title => text()();
  TextColumn get authorsJson => text()(); // JSON array of author strings
  IntColumn get year => integer().nullable()();
  TextColumn get journal => text().nullable()();
  TextColumn get volume => text().nullable()();
  TextColumn get issue => text().nullable()();
  TextColumn get pages => text().nullable()();
  TextColumn get doi => text().nullable()();
  TextColumn get url => text().nullable()();
  // Pre-formatted citation strings for each style
  TextColumn get apaFormatted => text().nullable()();
  TextColumn get ieeeFormatted => text().nullable()();
  TextColumn get chicagoFormatted => text().nullable()();
  TextColumn get indonesiaFormatted => text().nullable()();
  TextColumn get rawJson => text()(); // Full source data as JSON
  DateTimeColumn get lastSyncedAt =>
      dateTime().withDefault(currentDateAndTime)();
}

/// Metadata for PDFs indexed into ChromaDB for RAG
class RagIndexMetadata extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get filePath => text()();
  TextColumn get fileName => text()();
  TextColumn get fileHash => text()(); // SHA-256 for dedup
  IntColumn get fileSizeBytes => integer()();
  IntColumn get pageCount => integer().nullable()();
  IntColumn get chunkCount => integer().nullable()();
  TextColumn get collectionName =>
      text().withDefault(const Constant('references'))();
  TextColumn get indexStatus =>
      text().withDefault(const Constant('pending'))(); // pending|processing|completed|failed
  TextColumn get errorMessage => text().nullable()();
  DateTimeColumn get indexedAt => dateTime().nullable()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}

/// App settings as key-value store
class AppSettings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();
  TextColumn get valueType =>
      text().withDefault(const Constant('string'))(); // string|int|bool|json
  TextColumn get description => text().nullable()();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {key};
}

/// Junction: which citations are used in which documents
class DocumentCitations extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get documentId =>
      integer().references(Documents, #id, onDelete: KeyAction.cascade)();
  IntColumn get citationId =>
      integer().references(CitationCache, #id, onDelete: KeyAction.cascade)();
  IntColumn get positionIndex =>
      integer().withDefault(const Constant(0))(); // order in bibliography
  IntColumn get inlineCount =>
      integer().withDefault(const Constant(1))(); // times cited in text
  DateTimeColumn get insertedAt =>
      dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {documentId, citationId}
      ];
}

// ── DATABASE CLASS ───────────────────────────────────────────────

@DriftDatabase(
  tables: [
    Documents,
    ChatHistoryEntries,
    PromptTemplates,
    CitationCache,
    RagIndexMetadata,
    AppSettings,
    DocumentCitations,
  ],
  daos: [
    DocumentsDao,
    ChatHistoryDao,
    CitationsDao,
    SettingsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await _seedDefaultData();
        },
        onUpgrade: (m, from, to) async {
          // Future migrations handled here
        },
      );

  /// Seed default prompt templates on first run
  Future<void> _seedDefaultData() async {
    final templates = [
      PromptTemplatesCompanion.insert(
        name: 'Tulis Pendahuluan Bab',
        category: 'writing',
        templateText:
            'Tulis pendahuluan untuk {{chapter_name}} skripsi saya berjudul "{{document_title}}". '
            'Latar belakang masalah, rumusan masalah, tujuan, dan manfaat penelitian. '
            'Gunakan bahasa Indonesia akademik yang formal. Panjang sekitar {{word_count}} kata.',
        variablesJson: const Value('["chapter_name","document_title","word_count"]'),
        isSystem: const Value(true),
      ),
      PromptTemplatesCompanion.insert(
        name: 'Cari & Masukkan Sitasi',
        category: 'citation',
        templateText:
            'Cari referensi dari {{author}} tahun {{year}} di library saya '
            'dan masukkan inline citation dengan format {{citation_style}}.',
        variablesJson: const Value('["author","year","citation_style"]'),
        isSystem: const Value(true),
      ),
      PromptTemplatesCompanion.insert(
        name: 'Format Daftar Pustaka',
        category: 'format',
        templateText:
            'Format ulang semua daftar pustaka yang ada di dokumen ini '
            'sesuai dengan standar {{citation_style}}. '
            'Urutkan secara alfabetis berdasarkan nama belakang penulis pertama.',
        variablesJson: const Value('["citation_style"]'),
        isSystem: const Value(true),
      ),
      PromptTemplatesCompanion.insert(
        name: 'Review & Perbaiki Tata Bahasa',
        category: 'revision',
        templateText:
            'Review paragraf berikut dan perbaiki tata bahasa, ejaan, dan kejelasan '
            'sesuai dengan kaidah penulisan akademik Indonesia:\n\n{{selected_text}}',
        variablesJson: const Value('["selected_text"]'),
        isSystem: const Value(true),
      ),
      PromptTemplatesCompanion.insert(
        name: 'Buat Abstrak',
        category: 'writing',
        templateText:
            'Buat abstrak dalam bahasa Indonesia dan Inggris untuk skripsi saya '
            'berdasarkan isi dokumen ini. Maksimal 250 kata per bahasa. '
            'Sertakan: tujuan, metode, hasil, dan kesimpulan.',
        variablesJson: const Value('[]'),
        isSystem: const Value(true),
      ),
    ];

    for (final t in templates) {
      await into(promptTemplates).insert(t);
    }

    // Default app settings
    final defaultSettings = {
      'llm_provider': ('openai', 'string', 'LLM provider: openai|gemini|anthropic'),
      'llm_model': ('gpt-4o', 'string', 'LLM model name'),
      'llm_temperature': ('0.7', 'string', 'LLM creativity (0.0-1.0)'),
      'default_citation_style': ('APA', 'string', 'Default: APA|IEEE|Chicago|Indonesia'),
      'theme_mode': ('system', 'string', 'Theme: light|dark|system'),
      'auto_save_interval_seconds': ('30', 'int', 'Auto-save interval in seconds'),
      'rag_enabled': ('true', 'bool', 'Enable RAG context in AI responses'),
      'python_service_port': ('8765', 'int', 'Local FastAPI service port'),
    };

    for (final entry in defaultSettings.entries) {
      await into(appSettings).insert(
        AppSettingsCompanion.insert(
          key: entry.key,
          value: entry.value.$1,
          valueType: Value(entry.value.$2),
          description: Value(entry.value.$3),
        ),
      );
    }
  }
}

/// Opens the SQLite connection in the app's documents directory
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'antigravity_wp', 'app.sqlite'));
    await file.parent.create(recursive: true);
    return NativeDatabase.createInBackground(file);
  });
}
EODB

auto_push "Add Drift SQLite database schema with all 7 tables" "feat"

# Zotero DB Service
cat > flutter_app/lib/core/services/zotero_db_service.dart << 'EOZOTERO'
// ═══════════════════════════════════════════════════════════════════
// zotero_db_service.dart — Direct Zotero SQLite Reader
// Reads zotero.sqlite WITHOUT Zotero running (READ-ONLY)
// Uses sqflite_common_ffi for Windows desktop SQLite access
// ═══════════════════════════════════════════════════════════════════

import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:injectable/injectable.dart';
import '../models/citation.dart';

class ZoteroNotFoundException implements Exception {
  final String message;
  ZoteroNotFoundException(this.message);
  @override
  String toString() => 'ZoteroNotFoundException: $message';
}

class ZoteroAccessException implements Exception {
  final String message;
  ZoteroAccessException(this.message);
  @override
  String toString() => 'ZoteroAccessException: $message';
}

@singleton
class ZoteroDbService {
  Database? _db;
  String? _dbPath;

  /// Detect Zotero DB path from default Windows location or custom path
  Future<String> detectZoteroPath({String? customPath}) async {
    if (customPath != null && customPath.isNotEmpty) {
      if (await File(customPath).exists()) return customPath;
      throw ZoteroNotFoundException('Custom path tidak ditemukan: $customPath');
    }

    final userProfile = Platform.environment['USERPROFILE'] ??
        Platform.environment['HOMEPATH'] ??
        '';

    final candidates = [
      '$userProfile\\Zotero\\zotero.sqlite',
      '$userProfile\\Documents\\Zotero\\zotero.sqlite',
      '${Platform.environment['APPDATA']}\\Zotero\\Zotero\\zotero.sqlite',
    ];

    for (final candidate in candidates) {
      if (await File(candidate).exists()) {
        return candidate;
      }
    }

    throw ZoteroNotFoundException(
      'Zotero database tidak ditemukan di lokasi default.\n'
      'Pastikan Zotero terinstall, atau atur path manual di Settings.\n'
      'Path yang dicek:\n${candidates.join('\n')}',
    );
  }

  /// Open READ-ONLY connection to Zotero SQLite
  Future<void> connect({String? customPath}) async {
    sqfliteFfiInit();
    final factory = databaseFactoryFfi;

    _dbPath = await detectZoteroPath(customPath: customPath);

    try {
      // Open as READ-ONLY to never corrupt Zotero's database
      _db = await factory.openDatabase(
        _dbPath!,
        options: OpenDatabaseOptions(
          readOnly: true,
          singleInstance: false,
        ),
      );
    } catch (e) {
      throw ZoteroAccessException(
        'Gagal membuka zotero.sqlite: $e\n'
        'Pastikan Zotero tidak sedang mengunci file.',
      );
    }
  }

  Future<void> disconnect() async {
    await _db?.close();
    _db = null;
  }

  Future<bool> testConnection({String? customPath}) async {
    try {
      await connect(customPath: customPath);
      final result = await _db!.rawQuery('SELECT COUNT(*) as count FROM items');
      await disconnect();
      return (result.first['count'] as int) >= 0;
    } catch (_) {
      return false;
    }
  }

  /// Search citations by author name and/or year
  /// Query covers: creator lastName, title, year
  Future<List<Citation>> searchCitations(String query) async {
    if (_db == null) await connect();

    // Parse query: "Smith 2024" → author="Smith", year="2024"
    final parts = query.trim().split(RegExp(r'\s+'));
    String authorQuery = '';
    String yearQuery = '';
    String titleQuery = query;

    for (final part in parts) {
      if (RegExp(r'^\d{4}$').hasMatch(part)) {
        yearQuery = part;
      } else {
        authorQuery += '$part ';
      }
    }
    authorQuery = authorQuery.trim();

    const sql = '''
      SELECT
        items.key           AS cite_key,
        itemTypes.typeName  AS item_type,
        title_v.value       AS title,
        year_v.value        AS year,
        journal_v.value     AS journal,
        doi_v.value         AS doi,
        url_v.value         AS url,
        pages_v.value       AS pages,
        volume_v.value      AS volume,
        issue_v.value       AS issue,
        GROUP_CONCAT(
          CASE
            WHEN creators.firstName IS NOT NULL AND creators.firstName != ''
            THEN creators.lastName || ', ' || SUBSTR(creators.firstName, 1, 1) || '.'
            ELSE creators.lastName
          END,
          '; '
        ) AS authors
      FROM items
      JOIN itemTypes ON items.itemTypeID = itemTypes.itemTypeID
      -- Title (fieldID = 1)
      LEFT JOIN itemData     AS title_d  ON items.itemID = title_d.itemID  AND title_d.fieldID  = 1
      LEFT JOIN itemDataValues AS title_v ON title_d.valueID = title_v.valueID
      -- Year / Date (fieldID = 14)
      LEFT JOIN itemData     AS year_d   ON items.itemID = year_d.itemID   AND year_d.fieldID   = 14
      LEFT JOIN itemDataValues AS year_v  ON year_d.valueID = year_v.valueID
      -- Journal (fieldID = 12)
      LEFT JOIN itemData     AS journal_d ON items.itemID = journal_d.itemID AND journal_d.fieldID = 12
      LEFT JOIN itemDataValues AS journal_v ON journal_d.valueID = journal_v.valueID
      -- DOI (fieldID = 26)
      LEFT JOIN itemData     AS doi_d    ON items.itemID = doi_d.itemID    AND doi_d.fieldID    = 26
      LEFT JOIN itemDataValues AS doi_v   ON doi_d.valueID = doi_v.valueID
      -- URL (fieldID = 13)
      LEFT JOIN itemData     AS url_d    ON items.itemID = url_d.itemID    AND url_d.fieldID    = 13
      LEFT JOIN itemDataValues AS url_v   ON url_d.valueID = url_v.valueID
      -- Pages (fieldID = 10)
      LEFT JOIN itemData     AS pages_d  ON items.itemID = pages_d.itemID  AND pages_d.fieldID  = 10
      LEFT JOIN itemDataValues AS pages_v ON pages_d.valueID = pages_v.valueID
      -- Volume (fieldID = 28)
      LEFT JOIN itemData     AS volume_d ON items.itemID = volume_d.itemID AND volume_d.fieldID = 28
      LEFT JOIN itemDataValues AS volume_v ON volume_d.valueID = volume_v.valueID
      -- Issue/Number (fieldID = 29)
      LEFT JOIN itemData     AS issue_d  ON items.itemID = issue_d.itemID  AND issue_d.fieldID  = 29
      LEFT JOIN itemDataValues AS issue_v ON issue_d.valueID = issue_v.valueID
      -- Creators
      LEFT JOIN itemCreators ON items.itemID = itemCreators.itemID AND itemCreators.creatorTypeID = 1
      LEFT JOIN creators     ON itemCreators.creatorID = creators.creatorID
      -- Exclude deleted items
      WHERE items.itemID NOT IN (SELECT itemID FROM deletedItems)
        AND items.itemTypeID NOT IN (1, 14) -- exclude attachments & notes
        AND (
          (? != '' AND creators.lastName LIKE '%' || ? || '%')
          OR (? != '' AND title_v.value LIKE '%' || ? || '%')
          OR title_v.value LIKE '%' || ? || '%'
        )
        AND (? = '' OR SUBSTR(year_v.value, 1, 4) = ?)
      GROUP BY items.itemID
      ORDER BY year_v.value DESC, creators.lastName ASC
      LIMIT 20
    ''';

    final rows = await _db!.rawQuery(sql, [
      authorQuery, authorQuery,    // author filter
      titleQuery, titleQuery,      // title filter
      titleQuery,                  // fallback title
      yearQuery, yearQuery,        // year filter
    ]);

    return rows.map(_rowToCitation).toList();
  }

  Citation _rowToCitation(Map<String, dynamic> row) {
    final authors = (row['authors'] as String? ?? '').split('; ')
        .where((a) => a.isNotEmpty)
        .toList();
    final year = row['year'] != null
        ? int.tryParse((row['year'] as String).substring(0, 4))
        : null;

    return Citation(
      citeKey: row['cite_key'] as String,
      title: row['title'] as String? ?? 'Untitled',
      authors: authors,
      year: year,
      journal: row['journal'] as String?,
      doi: row['doi'] as String?,
      url: row['url'] as String?,
      pages: row['pages'] as String?,
      volume: row['volume'] as String?,
      issue: row['issue'] as String?,
      source: CitationSource.zotero,
      formattedStrings: const {}, // Will be populated by CitationFormatter
    );
  }
}
EOZOTERO

auto_push "Add ZoteroDbService with direct SQLite read and search SQL" "feat"

# Python FastAPI main
cat > python_service/main.py << 'EOMAIN'
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
EOMAIN

auto_push "Add FastAPI main.py with lifespan and CORS for localhost" "feat"

# Python requirements
cat > python_service/requirements.txt << 'EOREQ'
# Web Framework
fastapi==0.111.0
uvicorn[standard]==0.30.0
pydantic==2.8.0
pydantic-settings==2.3.0

# LLM Clients
openai==1.35.0
anthropic==0.30.0
google-generativeai==0.7.2

# PDF Processing
PyMuPDF==1.24.5          # fitz — fast PDF text extraction
python-docx==1.1.2        # .docx read/write

# PDF Export
WeasyPrint==62.1          # HTML → PDF (no wkhtmltopdf binary needed)

# RAG / Vector Store
chromadb==0.5.0           # Local embedded vector database
sentence-transformers==3.0.1  # Local embeddings (all-MiniLM-L6-v2)

# Utilities
aiofiles==24.1.0          # Async file operations
python-multipart==0.0.9   # File upload support
httpx==0.27.0             # Async HTTP client
jinja2==3.1.4             # Template rendering for citation strings
hashlib                   # Built-in — for file hashing (SHA-256)

# Development
pytest==8.2.2
pytest-asyncio==0.23.7
httpx==0.27.0             # For FastAPI test client
EOREQ

auto_push "Add Python requirements.txt with all dependencies" "chore"

# LLM Service Python
mkdir -p python_service/app/services/llm
cat > python_service/app/services/llm/llm_service.py << 'EOLLM'
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
EOLLM

auto_push "Add multi-provider LLM service (OpenAI/Anthropic/Gemini)" "feat"

# Python config
mkdir -p python_service/app/core
cat > python_service/app/core/config.py << 'EOCONFIG'
"""Application configuration via pydantic-settings"""

import os
from pathlib import Path
from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    # Service
    PORT: int = 8765
    DEBUG: bool = True
    
    # Paths
    DATA_DIR: Path = Path.home() / "AppData" / "Local" / "AntiGravityWP"
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
EOCONFIG

auto_push "Add pydantic settings configuration" "feat"

# Python API router
mkdir -p python_service/app/api/v1/endpoints
cat > python_service/app/api/v1/router.py << 'EOROUTER'
"""API v1 Router — Aggregates all endpoint routers"""

from fastapi import APIRouter
from .endpoints import llm, rag, citations, documents

api_v1_router = APIRouter()

api_v1_router.include_router(llm.router,       prefix="/llm",       tags=["LLM"])
api_v1_router.include_router(rag.router,        prefix="/rag",        tags=["RAG"])
api_v1_router.include_router(citations.router,  prefix="/citations",  tags=["Citations"])
api_v1_router.include_router(documents.router,  prefix="/documents",  tags=["Documents"])
EOROUTER

cat > python_service/app/api/v1/endpoints/llm.py << 'EOLLMEP'
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
EOLLMEP

auto_push "Add LLM streaming SSE endpoint" "feat"

# ─── STEP 6: DATABASE SCHEMA SQL ─────────────────────────────────
step "6 — Generate Database Schema SQL Documentation"

cat > docs/schemas/DATABASE_SCHEMA.sql << 'EOSQL'
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
EOSQL

auto_push "Add complete database schema SQL with sample data" "docs"

# ─── STEP 7: CREATE GITHUB REPO ──────────────────────────────────
step "7 — Create GitHub Repository"

cd "$PROJECT_DIR"
git remote 2>/dev/null || true

REPO_URL=$(gh repo create "${REPO_NAME}" \
    --description "${REPO_DESC}" \
    --${REPO_VISIBILITY} \
    --source=. \
    --remote=origin \
    --push \
    2>&1) && success "Repository created: https://github.com/${GITHUB_USERNAME}/${REPO_NAME}" \
      || warn "Repo might already exist, setting remote..."

# If repo exists, just add remote
if ! git remote | grep -q origin; then
    git remote add origin "https://github.com/${GITHUB_USERNAME}/${REPO_NAME}.git"
fi

git push -u origin main --force 2>/dev/null || true
success "Code pushed to GitHub!"

# ─── STEP 8: CREATE LABELS ───────────────────────────────────────
step "8 — Create GitHub Issue Labels"

declare -A LABELS=(
    # Priority
    ["priority:critical"]="b60205:🔴 Critical — Blocks release"
    ["priority:high"]="e4e669:🟡 High priority"
    ["priority:medium"]="0075ca:🔵 Medium priority"
    ["priority:low"]="cfd3d7:⚪ Low priority"
    # Type
    ["flutter"]="02569B:Flutter/Dart code"
    ["python"]="3572A5:Python code"
    ["database"]="336791:Database/SQL"
    ["ui"]="e1bee7:UI/UX component"
    ["ai"]="ff6f00:AI/LLM feature"
    ["rag"]="4caf50:RAG pipeline"
    ["citation"]="9c27b0:Citation system"
    ["editor"]="1565c0:Text editor"
    ["document"]="795548:Document management"
    ["export"]="00695c:Export/Import"
    ["settings"]="607d8b:Settings/Config"
    # Status
    ["setup"]="ffd700:Project setup task"
    ["devops"]="333333:CI/CD DevOps"
    ["models"]="8bc34a:Data models"
    ["zotero"]="CC2936:Zotero integration"
)

for label in "${!LABELS[@]}"; do
    IFS=':' read -r color desc <<< "${LABELS[$label]}"
    gh label create "$label" \
        --color "$color" \
        --description "$desc" \
        --repo "${GITHUB_USERNAME}/${REPO_NAME}" \
        --force 2>/dev/null && log "Label: $label" || true
done

success "All labels created!"

# ─── STEP 9: CREATE MILESTONES ────────────────────────────────────
step "9 — Create GitHub Milestones"

declare -A MILESTONES=(
    ["M0: Repository Bootstrap"]="Initial project setup, tooling, and repository configuration"
    ["M1: Core Database & Models"]="Drift SQLite schema, DAOs, Freezed domain models"
    ["M2: Editor Canvas"]="Split-screen UI, flutter_quill integration, AI chat panel"
    ["M3: Citation Engine"]="Zotero SQLite reader, citation formatter, auto-insert to editor"
    ["M4: RAG Pipeline"]="PDF indexing with ChromaDB, semantic search, context injection"
    ["M5: Document Management & Export"]="File manager, .docx/.pdf import/export"
    ["M6: LLM Integration & Settings"]="Multi-provider LLM, settings UI, API key management"
)

MILESTONE_NUMBERS=()
for title in "${!MILESTONES[@]}"; do
    desc="${MILESTONES[$title]}"
    result=$(gh api "repos/${GITHUB_USERNAME}/${REPO_NAME}/milestones" \
        --method POST \
        --field title="$title" \
        --field description="$desc" \
        --field state="open" \
        --jq '.number' 2>/dev/null) && {
        MILESTONE_NUMBERS["$title"]="$result"
        log "Milestone: $title (#$result)"
    } || warn "Milestone might exist: $title"
done

success "Milestones created!"

# ─── STEP 10: CREATE ISSUES ───────────────────────────────────────
step "10 — Create GitHub Issues from JSON"

ISSUES_CREATED=0

# Function to get milestone number by title fragment
get_milestone_num() {
    local fragment="$1"
    gh api "repos/${GITHUB_USERNAME}/${REPO_NAME}/milestones" \
        --jq ".[] | select(.title | contains(\"$fragment\")) | .number" 2>/dev/null | head -1
}

# Create all issues from JSON file
ISSUES_FILE="$(dirname "$0")/github_setup/github_issues.json"

if [[ -f "$ISSUES_FILE" ]]; then
    log "Reading issues from $ISSUES_FILE"
    
    MILESTONE_COUNT=$(jq length "$ISSUES_FILE")
    
    for i in $(seq 0 $((MILESTONE_COUNT - 1))); do
        MILESTONE_NAME=$(jq -r ".[$i].milestone" "$ISSUES_FILE")
        ISSUE_COUNT=$(jq ".[$i].issues | length" "$ISSUES_FILE")
        
        # Find milestone number
        MILESTONE_TAG=$(echo "$MILESTONE_NAME" | grep -oP 'M\d+' | head -1)
        M_NUM=$(get_milestone_num "$MILESTONE_TAG")
        
        log "Creating issues for: $MILESTONE_NAME (milestone #$M_NUM)"
        
        for j in $(seq 0 $((ISSUE_COUNT - 1))); do
            ISSUE_TITLE=$(jq -r ".[$i].issues[$j].title" "$ISSUES_FILE")
            ISSUE_BODY=$(jq -r ".[$i].issues[$j].body" "$ISSUES_FILE")
            LABELS_ARRAY=$(jq -r ".[$i].issues[$j].labels | join(\",\")" "$ISSUES_FILE")
            
            ISSUE_URL=$(gh issue create \
                --repo "${GITHUB_USERNAME}/${REPO_NAME}" \
                --title "$ISSUE_TITLE" \
                --body "$ISSUE_BODY" \
                --label "$LABELS_ARRAY" \
                ${M_NUM:+--milestone "$M_NUM"} \
                2>/dev/null)
            
            if [[ $? -eq 0 ]]; then
                ISSUES_CREATED=$((ISSUES_CREATED + 1))
                success "Issue #${ISSUES_CREATED}: $ISSUE_TITLE"
            else
                warn "Failed to create: $ISSUE_TITLE"
            fi
        done
    done
else
    warn "Issues JSON file not found, skipping issue creation"
fi

# ─── STEP 11: FINAL PUSH ─────────────────────────────────────────
step "11 — Final GitHub Sync"

cd "$PROJECT_DIR"

# Create GitHub Actions workflow
mkdir -p .github/workflows
cat > .github/workflows/ci.yml << 'EOCI'
name: AntiGravity WP CI

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

jobs:
  flutter-analyze:
    name: Flutter Analyze & Test
    runs-on: windows-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.22.0'
          channel: 'stable'
      - name: Get dependencies
        working-directory: flutter_app
        run: flutter pub get
      - name: Run analyzer
        working-directory: flutter_app
        run: flutter analyze
      - name: Run tests
        working-directory: flutter_app
        run: flutter test

  python-test:
    name: Python Tests
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.11'
      - name: Install dependencies
        working-directory: python_service
        run: pip install -r requirements.txt
      - name: Run tests
        working-directory: python_service
        run: pytest tests/ -v
EOCI

auto_push "Add GitHub Actions CI workflow" "chore"

# Final summary
cat > .github/ISSUE_TEMPLATE/bug_report.md << 'EOBUG'
---
name: Bug Report
about: Report a bug in AntiGravity WP
title: '[BUG] '
labels: 'bug'
---

## Describe the Bug
A clear description of the bug.

## Steps to Reproduce
1. Go to '...'
2. Click on '...'
3. See error

## Expected Behavior
What should have happened.

## Actual Behavior  
What actually happened.

## Environment
- OS: Windows [10/11]
- App Version: 
- LLM Provider: [OpenAI/Gemini/Anthropic]
- Zotero Version (if citation bug):

## Screenshots
If applicable, add screenshots.

## Logs
```
Paste any relevant logs here
```
EOBUG

cat > .github/ISSUE_TEMPLATE/feature_request.md << 'EOFEAT'
---
name: Feature Request
about: Suggest a new feature for AntiGravity WP
title: '[FEAT] '
labels: 'enhancement'
---

## Feature Description
A clear description of what you want.

## Problem It Solves
What pain point does this address?

## Proposed Solution
How should this be implemented?

## Acceptance Criteria
- [ ] Criteria 1
- [ ] Criteria 2

## Additional Context
Any mockups, references, or examples.
EOFEAT

auto_push "Add GitHub issue templates and CI workflow" "chore"

# ─── DONE ─────────────────────────────────────────────────────────
echo ""
echo -e "${BOLD}${GREEN}"
echo "════════════════════════════════════════════════════════"
echo "  ⚡ ANTIGRAVITY WP — GITHUB SETUP COMPLETE!"
echo "════════════════════════════════════════════════════════"
echo -e "${NC}"
echo -e "  📦 Repository:  ${CYAN}https://github.com/${GITHUB_USERNAME}/${REPO_NAME}${NC}"
echo -e "  📋 Issues:      ${CYAN}https://github.com/${GITHUB_USERNAME}/${REPO_NAME}/issues${NC}"
echo -e "  🎯 Milestones:  ${CYAN}https://github.com/${GITHUB_USERNAME}/${REPO_NAME}/milestones${NC}"
echo -e "  🏷️  Labels:     ${CYAN}https://github.com/${GITHUB_USERNAME}/${REPO_NAME}/labels${NC}"
echo ""
echo -e "  ✅ Issues created: ${BOLD}${ISSUES_CREATED}${NC}"
echo -e "  📁 Project dirs:   ${BOLD}$(find "$PROJECT_DIR" -type d | wc -l)${NC}"
echo -e "  📄 Files created:  ${BOLD}$(find "$PROJECT_DIR" -type f | wc -l)${NC}"
echo ""
echo -e "${YELLOW}  NEXT STEPS:${NC}"
echo "  1. cd ${REPO_NAME}/flutter_app && flutter pub get"
echo "  2. cd ../python_service && pip install -r requirements.txt"
echo "  3. Assign issues ke developer dan mulai coding!"
echo ""

# ScriptEase App — System Architecture

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

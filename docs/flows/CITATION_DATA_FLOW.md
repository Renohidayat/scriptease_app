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

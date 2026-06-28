# ════════════════════════════════════════════════════════════════════
# ANTIGRAVITY WP — MASTER ARCHITECTURE PROMPT v2.0
# ════════════════════════════════════════════════════════════════════
#
# CARA PAKAI: Copy seluruh konten di bawah garis ini dan paste
# ke AI (Claude / GPT-4o / Gemini) sebagai satu prompt tunggal.
# ════════════════════════════════════════════════════════════════════

---

## IDENTITAS PROYEK

**Nama Produk:** AntiGravity WP
**Tagline:** *"Defy the gravity of academic writing — write, cite, and publish at the speed of thought."*
**Platform Target:** Windows 10/11 Desktop (64-bit)
**Pengguna Utama:** Mahasiswa S1/S2/S3, peneliti, dan dosen di Indonesia yang mengerjakan skripsi, tesis, disertasi, dan paper ilmiah.

---

## FILOSOFI DESAIN — MENGAPA "ANTIGRAVITY"?

Gravitasi dalam konteks ini adalah **beban kognitif yang menghambat produktivitas akademik**:

- ⬇️ Gravity 1: Berpindah-pindah antara Word → Zotero → ChatGPT → Google Scholar → kembali ke Word. Setiap perpindahan memutus alur pikir (*flow state*).
- ⬇️ Gravity 2: Aturan format yang rigid (APA, IEEE, standar universitas) memaksa mahasiswa menjadi *formatter*, bukan *thinker*.
- ⬇️ Gravity 3: Ketergantungan cloud yang membuat data riset sensitif tersimpan di server orang lain.
- ⬇️ Gravity 4: AI generik (ChatGPT web) tidak tahu konteks dokumen kamu — hasilnya selalu perlu diedit ulang.

**AntiGravity WP melawan semua gravitasi ini** dengan menciptakan satu ruang kerja terpadu, lokal, dan sadar-konteks.

---

## PERAN AI DALAM PROYEK INI

Kamu berperan sebagai **Senior Software Architect** yang ditugaskan merancang seluruh sistem AntiGravity WP dari nol. Output yang dihasilkan harus **production-ready**, bukan sekadar pseudo-code atau konsep abstrak. Setiap komponen harus memiliki:

1. Alasan teknis pemilihan teknologi (*rationale*)
2. Antarmuka antar-komponen yang jelas (*interfaces & contracts*)
3. Pertimbangan edge-case dan failure mode
4. Panduan implementasi yang bisa langsung dikerjakan developer

---

## TECH STACK — KEPUTUSAN FINAL (NON-NEGOTIABLE)

### Layer 1 — Desktop Frontend
```
Runtime:          Flutter for Windows (Flutter SDK 3.22+)
Editor Engine:    flutter_quill ^10.x (Delta format, extensible)
                  → Custom QuillEmbedBuilder untuk inline citations
State:            flutter_bloc ^8.x + equatable
DI Container:     get_it + injectable (code generation)
Navigation:       go_router ^13.x
IPC ke Python:    dio ^5.x (HTTP ke localhost:8765)
File System:      path_provider + dart:io (Windows native)
SQLite Client:    drift ^2.x (type-safe, reactive streams)
Serialization:    freezed + json_serializable
```

### Layer 2 — Local Python Microservice
```
Framework:        FastAPI 0.111+ dengan Uvicorn (async)
PDF Parsing:      PyMuPDF (fitz) — lebih cepat dari pdfplumber
Vector Store:     ChromaDB (lokal, embedded, no server needed)
Embeddings:       sentence-transformers (all-MiniLM-L6-v2, lokal)
LLM Client:       openai SDK (kompatibel OpenAI / Gemini / Anthropic)
Document Export:  python-docx (buat/edit .docx)
                  WeasyPrint (HTML → PDF lokal)
Citation Parse:   Jinja2 (render template format sitasi)
Process Manager:  subprocess + psutil (Flutter spawn Python)
```

### Layer 3 — Local Storage
```
Utama:            SQLite via Drift (embedded di Flutter)
Vector Index:     ChromaDB (embedded Python, folder lokal)
Zotero Bridge:    Read-only SQLite query ke zotero.sqlite
Cache:            Hive ^2.x (key-value, lightweight)
```

### Layer 4 — External Integrations
```
LLM APIs:         OpenAI GPT-4o / Google Gemini 1.5 Pro /
                  Anthropic Claude 3.5 Sonnet
                  → Satu interface abstrak, pluggable provider
Mendeley:         OAuth2 REST API v1 (reference sync)
Zotero:           Local DB parsing (offline-first)
                  + Zotero Web API sebagai fallback
```

---

## ARSITEKTUR SISTEM — DELIVERABLE 1

Buat diagram arsitektur sistem **level tinggi** dalam dua format:

### A. Diagram Mermaid.js (untuk dokumentasi GitHub)

Buat diagram `graph TB` yang mencakup seluruh komponen berikut dengan relasi yang akurat:

**Komponen yang harus muncul:**
- `Flutter Windows App` sebagai root
  - `Editor Canvas` (flutter_quill + custom embeds)
  - `AI Chat Panel` (split-screen kanan)
  - `Document Manager Sidebar`
  - `Citation Panel`
  - `Settings / LLM Config`
- `Drift SQLite Database` (lokal, dalam Flutter)
  - Tabel: documents, chat_history, prompt_templates, citation_cache, app_settings, rag_metadata
- `Python FastAPI Service` (localhost:8765)
  - `/api/v1/llm/` — LLM proxy + streaming
  - `/api/v1/rag/` — RAG query + indexing
  - `/api/v1/citations/` — Citation search + format
  - `/api/v1/documents/` — docx/pdf import-export
- `ChromaDB` (vector store lokal, dikelola Python)
- `Zotero.sqlite` (read-only, path: C:\Users\<User>\Zotero\zotero.sqlite)
- `Mendeley REST API` (external, opsional)
- `LLM API Provider` (external: OpenAI/Gemini/Anthropic)
- `Local File System` (Windows, dokumen user)

### B. Tabel Komponen & Tanggung Jawab

Format: `Komponen | Teknologi | Tanggung Jawab | Berkomunikasi Dengan`

---

## DATA FLOW — DELIVERABLE 2

Buat panduan **step-by-step terperinci** untuk 3 skenario kritis berikut:

### Skenario A: "Tulis Bab 1 dan sitir Smith 2024"

Deskripsikan setiap langkah sebagai numbered flow dengan format:
```
[STEP N] AKTOR → TARGET
  Input:   (apa yang dikirim)
  Proses:  (apa yang terjadi)
  Output:  (apa yang dihasilkan)
  Latency: (estimasi waktu realistis)
```

Flow harus mencakup:
1. User mengetik prompt di AI Chat Panel
2. Flutter membaca snapshot teks dokumen aktif (sebagai `document_context`)
3. Flutter POST ke Python `/api/v1/citations/search` dengan query "Smith 2024"
4. Python query ke `zotero.sqlite` (READ-ONLY), fallback ke Mendeley API
5. Citation ditemukan → extract `citeKey`, `authorYear`, `fullReference`
6. Flutter POST ke Python `/api/v1/llm/stream` dengan:
   - system prompt (academic writing instructions)
   - document_context (isi dokumen saat ini)
   - citation_context (data Smith 2024 dari Zotero)
   - user_prompt ("Tulis Bab 1 dan sitir Smith 2024")
7. Python stream response ke Flutter via SSE (Server-Sent Events)
8. Flutter render stream ke AI Chat Panel secara real-time
9. User klik "Insert into Document" 
10. Flutter inject Delta operations ke flutter_quill:
    - Teks bab dari LLM
    - `CitationEmbed` object (inline `(Smith, 2024)`)
    - Update Daftar Pustaka section otomatis
11. Flutter SAVE ke SQLite (chat_history + document_snapshot)

### Skenario B: "Indexing PDF referensi baru ke RAG"

Flow mulai dari user drag-drop PDF ke app, sampai PDF ter-index dan siap di-query.

### Skenario C: "Export dokumen ke .docx dengan format APA"

Flow dari klik "Export" sampai file `.docx` tersimpan di folder user.

---

## STRUKTUR DIREKTORI — DELIVERABLE 3

Buat struktur direktori **LENGKAP** dalam format `tree`, mencakup seluruh file utama (bukan hanya folder). Setiap file harus disertai komentar singkat fungsinya.

### Aturan Penamaan yang Harus Diikuti:
- Flutter: `snake_case` untuk file, `PascalCase` untuk class
- Python: `snake_case` untuk semua (PEP 8)
- Folder fitur Flutter: satu folder per fitur, isi: `bloc/`, `widgets/`, `models/`, `services/` (jika ada)
- Tidak ada file `helper.dart` atau `utils.py` yang ambigu — semua file harus punya nama spesifik

### Struktur Minimal yang Harus Ada:
```
antigravity-wp/
├── flutter_app/
│   ├── lib/
│   │   ├── main.dart
│   │   ├── app.dart
│   │   ├── core/
│   │   │   ├── database/
│   │   │   │   ├── app_database.dart       ← Drift DB class
│   │   │   │   ├── app_database.g.dart     ← generated
│   │   │   │   ├── dao/
│   │   │   │   │   ├── documents_dao.dart
│   │   │   │   │   ├── chat_history_dao.dart
│   │   │   │   │   ├── citations_dao.dart
│   │   │   │   │   └── settings_dao.dart
│   │   │   │   └── migrations/
│   │   │   │       └── migration_v1_to_v2.dart
│   │   │   ├── services/
│   │   │   │   ├── python_service_client.dart  ← HTTP client ke FastAPI
│   │   │   │   ├── zotero_db_service.dart      ← Direct SQLite ke Zotero
│   │   │   │   ├── filesystem_service.dart
│   │   │   │   └── llm_service.dart            ← Abstraksi LLM provider
│   │   │   ├── models/
│   │   │   │   ├── document.dart
│   │   │   │   ├── citation.dart
│   │   │   │   ├── chat_message.dart
│   │   │   │   └── llm_config.dart
│   │   │   └── di/
│   │   │       └── injection.dart              ← get_it setup
│   │   ├── features/
│   │   │   ├── editor/
│   │   │   ├── ai_chat/
│   │   │   ├── citations/
│   │   │   ├── document_manager/
│   │   │   └── settings/
│   │   └── shared/
│   │       ├── theme/
│   │       ├── widgets/
│   │       └── constants/
│   └── pubspec.yaml                            ← dengan semua dependensi
│
├── python_service/
│   ├── main.py                                 ← Entry point FastAPI
│   ├── app/
│   │   ├── api/
│   │   │   └── v1/
│   │   │       ├── router.py
│   │   │       ├── endpoints/
│   │   │       │   ├── llm.py
│   │   │       │   ├── rag.py
│   │   │       │   ├── citations.py
│   │   │       │   └── documents.py
│   │   ├── core/
│   │   │   ├── config.py                       ← Settings via pydantic-settings
│   │   │   └── lifespan.py                     ← Startup/shutdown events
│   │   ├── services/
│   │   │   ├── llm_service.py
│   │   │   ├── rag_service.py
│   │   │   ├── zotero_service.py
│   │   │   ├── citation_formatter.py
│   │   │   └── document_service.py
│   │   └── models/
│   │       ├── llm_models.py
│   │       ├── citation_models.py
│   │       └── rag_models.py
│   └── requirements.txt
│
└── docs/
    ├── architecture/
    ├── schemas/
    └── flows/
```

---

## DATABASE SCHEMA — DELIVERABLE 4

Buat schema SQLite **lengkap dengan DDL**, untuk setiap tabel berikut. Setiap tabel harus disertai:
- CREATE TABLE statement dengan tipe data SQLite yang tepat
- Index yang diperlukan untuk query performance
- Komentar pada setiap kolom yang tidak self-explanatory
- Minimal 3 contoh row data realistis (sebagai INSERT statements)

### Tabel yang Wajib Didefinisikan:

**1. `documents`** — Dokumen aktif yang disimpan user
```
Kolom minimum: id, title, file_path, content_delta (JSON),
content_plain_text, word_count, citation_style,
academic_format, created_at, updated_at, last_opened_at,
is_deleted (soft delete)
```

**2. `chat_history`** — Riwayat percakapan AI per dokumen
```
Kolom minimum: id, document_id (FK), session_id,
role (enum: user/assistant/system), content,
token_count_input, token_count_output, llm_provider,
llm_model, latency_ms, created_at
Relasi: document_id → documents.id (CASCADE DELETE)
```

**3. `prompt_templates`** — Template prompt yang bisa disimpan/dipakai ulang
```
Kolom minimum: id, name, category (enum: writing/citation/format/analysis),
template_text (dengan {{placeholder}} syntax),
variables_json (array of variable names),
usage_count, is_system (built-in vs user-created),
created_at, updated_at
```

**4. `citation_cache`** — Cache hasil pencarian sitasi dari Zotero/Mendeley
```
Kolom minimum: id, source (enum: zotero/mendeley/manual),
external_id, cite_key, title, authors_json, year,
journal, volume, issue, pages, doi, url,
apa_formatted, ieee_formatted, chicago_formatted,
raw_json (full source data), last_synced_at
```

**5. `rag_index_metadata`** — Metadata PDF yang sudah di-index ke ChromaDB
```
Kolom minimum: id, file_path, file_name, file_hash (SHA-256),
file_size_bytes, page_count, chunk_count,
collection_name (ChromaDB collection),
index_status (enum: pending/processing/completed/failed),
error_message, indexed_at, created_at
```

**6. `app_settings`** — Konfigurasi aplikasi (key-value store)
```
Kolom minimum: key (PRIMARY KEY), value, value_type
(enum: string/int/bool/json), description, updated_at
Isi default: llm_provider, api_key_encrypted,
zotero_db_path, mendeley_access_token,
default_citation_style, theme_mode, dll
```

**7. `document_citations`** — Junction table: sitasi yang dipakai dalam dokumen tertentu
```
Kolom minimum: id, document_id (FK), citation_id (FK),
position_index (urutan dalam daftar pustaka),
inline_count (berapa kali dikutip dalam teks),
inserted_at
```

---

## PANDUAN IMPLEMENTASI — DELIVERABLE 5

### A. Zotero SQLite Connection (Flutter → zotero.sqlite)

Buat implementasi **lengkap dan runnable** untuk:

**1. Service class `ZoteroDbService` dalam Dart:**
- Method: `findCitations(String query)` — full-text search di Zotero
- Method: `getCitationByKey(String citeKey)` — lookup spesifik
- Method: `getAllReferences()` — list semua referensi
- Method: `testConnection()` — cek apakah zotero.sqlite bisa diakses
- Error handling: FileNotFoundException, DatabaseException, PermissionException
- Gunakan package `sqflite_common_ffi` untuk Windows desktop

**Query SQL yang harus diimplementasi:**
```sql
-- Implementasikan query ini dalam Dart:
-- Search items by author dan year di Zotero schema
SELECT
    items.key           AS citeKey,
    itemTypes.typeName  AS itemType,
    -- Author: ambil dari itemCreators + creators tables
    -- Title: ambil dari itemDataValues WHERE fieldID = 1
    -- Year: ambil dari itemDataValues WHERE fieldID = 14  
    -- Journal: ambil dari itemDataValues WHERE fieldID = 12
    -- DOI: ambil dari itemDataValues WHERE fieldID = 26
FROM items
JOIN itemTypes ON items.itemTypeID = itemTypes.itemTypeID
-- ... (lengkapi JOIN-nya)
WHERE items.itemID NOT IN (SELECT itemID FROM deletedItems)
  AND [filter berdasarkan author/title/year]
ORDER BY [year DESC, author ASC]
LIMIT 20;
```

**2. Python fallback service `zotero_service.py`:**
- Fungsi async yang sama tapi dari sisi Python
- Digunakan ketika Dart tidak bisa akses langsung (permission issue)

**3. Contoh penggunaan dalam BLoC:**
```dart
// Tunjukkan CitationBloc lengkap dengan:
// - Event: SearchCitationsEvent(query: "Smith 2024")
// - State: CitationLoadingState, CitationLoadedState, CitationErrorState
// - BLoC class yang memanggil ZoteroDbService
```

### B. LLM Streaming Implementation

Buat implementasi **Server-Sent Events (SSE) streaming** end-to-end:

**Python (FastAPI endpoint):**
```python
# /api/v1/llm/stream — POST endpoint
# Menerima: messages[], model, context_document, citation_context
# Returns: StreamingResponse dengan SSE format
# Harus support: OpenAI, Anthropic, Gemini dalam satu endpoint
```

**Dart (Flutter client):**
```dart
// Stream<String> streamLlmResponse(LlmRequest request)
// Menggunakan dio + StreamController
// Real-time render ke UI sambil stream berjalan
```

### C. Citation Auto-Insert ke flutter_quill

Buat custom embed untuk flutter_quill:

```dart
// CitationEmbed: tampil sebagai "(Smith, 2024)" dalam teks
// - Clickable untuk edit/hapus
// - Menyimpan metadata penuh (tidak hanya display text)
// - Auto-update Daftar Pustaka section saat embed diinsert/dihapus
```

---

## SISTEM PROMPT AKADEMIK — DELIVERABLE 6 (BONUS)

Rancang **system prompt architecture** untuk LLM agar menghasilkan tulisan akademik berkualitas tinggi:

### Master System Prompt Template:
```
Buat system prompt dalam bahasa Inggris yang:
1. Mendefinisikan peran AI sebagai asisten penulisan akademik Indonesia
2. Menyertakan aturan format berdasarkan {citation_style} (APA/IEEE/Chicago)
3. Memuat konteks dokumen: {document_title}, {current_chapter}, {word_count}
4. Memuat data sitasi yang tersedia: {available_citations_json}
5. Aturan output: selalu dalam format Delta JSON (flutter_quill) atau Markdown
6. Larangan: tidak boleh membuat sitasi fiktif, selalu gunakan data dari {citation_context}
```

### Chain-of-Thought Prompt untuk Penulisan Bab:
```
Buat prompt teknik CoT yang memandu LLM untuk:
1. Analisis struktur bab yang diminta
2. Identifikasi sitasi yang relevan dari {citation_context}
3. Draft outline internal sebelum menulis
4. Tulis konten dengan inline citation yang akurat
5. Output dalam format yang bisa langsung di-inject ke editor
```

---

## OUTPUT FORMAT REQUIREMENTS

Untuk setiap deliverable di atas, ikuti format ini:

```
## [DELIVERABLE N] — [NAMA]
### Overview
[Penjelasan singkat 2-3 kalimat]

### Implementation
[Kode / Diagram / Schema]

### Notes & Tradeoffs
[Keputusan teknis dan alasannya]

### Next Steps
[Apa yang harus dilakukan developer setelah ini]
```

**Kode harus:**
- ✅ Bisa di-copy-paste dan langsung dijalankan
- ✅ Include semua import yang diperlukan
- ✅ Punya error handling yang proper
- ✅ Ada komentar untuk bagian yang kompleks
- ❌ Jangan pseudo-code atau placeholder seperti `// TODO: implement this`
- ❌ Jangan potong kode dengan `// ... rest of implementation`

---

## KONTEKS TAMBAHAN UNTUK AI

**Bahasa dokumen output:** Campuran Indonesia + Inggris (komentar kode boleh Inggris, teks dokumentasi boleh Indonesia)

**Prioritas non-fungsional:**
1. **Privacy first** — tidak ada data user yang keluar ke internet tanpa izin eksplisit
2. **Offline capable** — semua fitur inti harus bekerja tanpa internet (kecuali LLM call)
3. **Performance** — editor harus tetap responsif meski dokumen 100+ halaman
4. **Extensibility** — mudah menambah LLM provider baru, format sitasi baru, style universitas baru

**Target hardware minimum:**
- CPU: Intel Core i5 gen 8 / AMD Ryzen 5 3600
- RAM: 8 GB
- Storage: 2 GB untuk app + model embedding
- OS: Windows 10 21H2 atau lebih baru

**Hal yang TIDAK termasuk scope v1.0:**
- Real-time collaboration (multi-user)
- Mobile/web version
- Built-in grammar checker (gunakan API eksternal)
- Cloud sync (sync tetap manual/lokal)

---

*[END OF PROMPT — Paste semua teks di atas ke AI tanpa modifikasi untuk hasil optimal]*

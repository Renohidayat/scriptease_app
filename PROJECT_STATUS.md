# 🚀 ScriptEase App - Project Status & Handover

**Terakhir Diperbarui:** 28 Juni 2026

## 🎯 Pencapaian Sejauh Ini (Selesai)

✅ **Phase 1: Foundation (M1 & M2)**
- Setup struktur *monorepo* (Flutter frontend + Python FastAPI backend).
- Konfigurasi Database lokal (Drift SQLite) dengan Schema lengkap (`documents`, `chat_history`, `citation_cache`, `prompt_templates`).
- Koneksi Zotero Database secara *read-only* (menggunakan `sqflite_common_ffi`).

✅ **Phase 2: Split-Screen Editor Canvas (M3)**
- UI layar terbagi (*Split-screen*): Editor Teks di kiri (menggunakan `flutter_quill`) dan AI Assistant Chat di kanan.
- Sistem Blok (BLoC) untuk *auto-save* teks dokumen (Debounce 2 detik).
- Sistem *streaming* respons AI menggunakan Server-Sent Events (SSE).
- Custom Citation Embed block di dalam Editor.

✅ **Phase 3: Export Engine (M4)**
- Integrasi library `python-docx` dan `docx2pdf` di *backend*.
- Pembuatan `ExportService` untuk mengonversi *rich-text* Delta JSON ke DOCX dan PDF beserta format Daftar Pustaka otomatis.
- Penambahan tombol ekspor (Download) di UI Flutter.
- Dukungan platform `Windows` di Flutter (`flutter create --platforms=windows .`).

---

## 🚧 Status Terakhir (Blocker saat ini)
- **Environment Setup:** Komputer pengguna (*local machine*) belum menginstal **Visual Studio C++ Build Tools**, sehingga *build* untuk Flutter Windows Desktop dan instalasi modul AI (`chromadb`) di Python sempat gagal. 
- *Next time*, sebelum lanjut, pastikan **C++ Build Tools** sudah terinstal!

---

## ⏭️ Langkah Selanjutnya (Next Session)

Saat kita kembali mengerjakan proyek ini, kita akan langsung masuk ke:

📍 **Phase 4: RAG Pipeline & AI Integration (M5 & M6)**
1. Mengintegrasikan **ChromaDB** untuk menyimpan vektor/indeks dokumen referensi PDF (RAG).
2. Membuat endpoint untuk *upload* referensi PDF dan mengekstrak teksnya.
3. Menghubungkan endpoint Chat ke LLM eksternal (OpenAI/Gemini/Anthropic).
4. Pemolesan (Polishing) interaksi UI Chat agar lebih mulus.

> **Pesan untuk AI Assistant (Sesi Berikutnya):** 
> *Baca file ini sebagai referensi utama Anda. Abaikan Phase 1-3 karena sudah selesai. Fokuskan pekerjaan pada perancangan Phase 4 (RAG Vector Database).*

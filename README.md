# ⚡ ScriptEase App

> **Defy the gravity of academic writing — write, cite, and publish at the speed of thought.**

[![Flutter Windows](https://img.shields.io/badge/Flutter-Windows-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Python FastAPI](https://img.shields.io/badge/Python-FastAPI-009688?logo=fastapi&logoColor=white)](https://fastapi.tiangolo.com)
[![Status](https://img.shields.io/badge/Status-Active%20Dev-orange)](https://github.com/your_username/scriptease-app/issues)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

ScriptEase App is an **AI-powered academic word processor** for Windows — a Microsoft Word alternative built specifically for Indonesian students and researchers writing skripsi, tesis, and disertasi.

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

git clone https://github.com/your_username/scriptease-app.git
cd scriptease-app

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

# 🧠 AI Workflow — 2026 Edition

> Mein systematischer Ansatz für die Arbeit mit modernen KI-Tools.
> **Ein Modell für alles ist 2026 vorbei** — die Spezialisierung gewinnt.

---

## 🎯 Kernidee

Statt sich auf **ein** Modell zu verlassen, wird jede Aufgabe an die **stärkste KI für genau diesen Job** geroutet. Das Ergebnis: bessere Outputs, niedrigere Kosten, weniger Frust.

```
┌─────────────────────────────────────────────────────────┐
│  Aufgabe → Router → Spezialist-Modell → Validator        │
└─────────────────────────────────────────────────────────┘
```

## 🏆 Modell-Spezialisierung (Stand April 2026)

| Aufgabentyp | Best-in-Class | Warum |
|---|---|---|
| 🧩 **Komplexe Codebase / Agentic** | **Claude Opus 4.7** | SWE-bench Pro 64.3 %, lange Tool-Use-Loops |
| 💻 **Terminal / Bash / Codex-Tasks** | **GPT-5.5** | Terminal-Bench 2.0 SOTA (82.7 %) |
| 🎨 **UI / Design / Frontend-Polish** | **Gemini 3.1 Pro** | Beste Vision + Multimodal-Reasoning |
| 📝 **Lange Texte / Doku / Reports** | **Claude Opus 4.7** | Natürlichste Prosa, 128K Output |
| 💰 **Bulk / Routine / Cost-sensitiv** | **DeepSeek V4** | 22× günstiger bei 79.5 % Aider |
| 🔍 **Recherche / Long-Context** | **Gemini 3.1 Pro** | 2M Token Kontext |
| 🤖 **Allrounder / Ökosystem** | **GPT-5.5** | Größtes Plugin-Ökosystem |

## 📁 Was ist hier drin?

| Ordner | Inhalt |
|---|---|
| [`docs/`](docs/) | Tiefe Guides — Modell-Auswahl, Tool-Setup, Workflows |
| [`prompts/`](prompts/) | Wiederverwendbare Prompt-Patterns |
| [`benchmarks/`](benchmarks/) | Aktuelle Coding-Benchmarks Q2 2026 |

### 📚 Quick Links
- 🎯 [Modell-Auswahl: Welche KI für welchen Job?](docs/01-model-selection.md)
- ⚙️ [Claude Code Setup — Power User Config](docs/02-claude-code-setup.md)
- 💬 [Prompt-Patterns die wirklich funktionieren](docs/03-prompt-patterns.md)
- 🔌 [MCP Server Stack](docs/04-mcp-servers.md)
- 🔄 [Multi-Model Workflow End-to-End](docs/05-multi-model-workflow.md)
- 📊 [Coding-Benchmarks Q2 2026](benchmarks/2026-Q2-coding.md)

## 🛠️ Mein aktueller Stack

```yaml
primary_ide:        Claude Code (Opus 4.7)        # Hauptarbeit, agentic
quick_completions:  GitHub Copilot (Opus 4.6)     # IDE-Inline
terminal_tasks:     GPT-5.5 via Codex CLI         # Bash, Refactors
design_review:      Gemini 3.1 Pro                # UI / Multimodal
research:           Gemini 3.1 Pro (2M context)   # Long-Context
bulk_jobs:          DeepSeek V4 via API           # Cost-sensitive
```

## 💡 Prinzipien

1. **Passive Analyse vor Action** — erst lesen/verstehen, dann ändern.
2. **Ein Tool pro Layer** — Cursor *oder* Claude Code, nicht beide gleichzeitig.
3. **Prompts sind Code** — versionieren, testen, wiederverwenden.
4. **Kontext ist König** — schlechter Output meistens = fehlender Kontext.
5. **Validate everything** — KI-Output ist ein Vorschlag, kein Ergebnis.

---

## 📈 Status

🚧 **Living Document** — wird laufend aktualisiert, wenn neue Modelle / Tools rauskommen.

⭐ Letzter Update: April 2026 (GPT-5.5 Launch, Claude Opus 4.7)

---

<sub>Made with care by [Hamid](https://github.com/hamid49174) · Hamburg, Germany</sub>

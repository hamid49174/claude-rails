# 🎯 Modell-Auswahl: Welche KI für welchen Job?

Die wichtigste Skill 2026: **das richtige Modell fürs richtige Problem wählen**.

## Entscheidungsbaum

```
                    ┌─ Komplexe Codebase / Agentic ──→ Claude Opus 4.7
                    │
                    ├─ Terminal / Bash-heavy ─────────→ GPT-5.5 (Codex CLI)
                    │
   Aufgabe ─────────┼─ UI / Design / Multimodal ──────→ Gemini 3.1 Pro
                    │
                    ├─ Long-Context Research (>200K) ─→ Gemini 3.1 Pro (2M)
                    │
                    ├─ Bulk / Cost-sensitive ─────────→ DeepSeek V4
                    │
                    └─ Sonst (Allrounder) ────────────→ GPT-5.5
```

## Detail-Matrix (April 2026)

| Modell | Stärke | Schwäche | Pricing | Mein Einsatz |
|---|---|---|---|---|
| **Claude Opus 4.7** | Agentic Coding, lange Sessions, Reasoning, Prosa | Etwas teurer als GPT | $5/$25 per 1M | 🟢 **Hauptarbeit** |
| **GPT-5.5** | Terminal, Tool-Use, Token-Effizienz | Auf SWE-bench Pro hinten | $5/$30 per 1M | 🟢 Terminal & Codex |
| **Gemini 3.1 Pro** | Long-Context (2M), Vision, Reasoning | Code-Tasks schwächer | $3/$15 per 1M | 🟡 Research, Design |
| **DeepSeek V4** | Preis-Leistung extrem | Englisch-Bias, weniger reif | $0.27/$1.10 per 1M | 🟡 Bulk-Jobs |
| **MiniMax M2.5** | China-Markt, schnell | Geringere Verbreitung | varies | ❌ noch nicht im Stack |

## Faustregeln

### ✅ Wann Claude Opus 4.7
- Du arbeitest in einer Codebase mit >50 Files
- Multi-Step-Tasks: "lies X, ändere Y, teste Z, committe"
- Reverse Engineering, Security-Analyse
- Lange Markdown-Reports / Doku
- Wenn die KI **denken** soll, nicht nur ausführen

### ✅ Wann GPT-5.5
- Reine Bash/Terminal-Loops
- Schnelle Refactors mit klarem Scope
- ChatGPT-Plugins / OpenAI-Ökosystem nötig
- Token-Kosten kritisch (effizienter als Claude bei gleicher Aufgabe)

### ✅ Wann Gemini 3.1 Pro
- Du hast einen 500K-Token Codebase-Dump zu analysieren
- Screenshot-zu-Code, Design-Review
- Multilingual / Übersetzungen
- Wissenschaftliche Paper durchsuchen

### ✅ Wann DeepSeek V4
- Hunderttausende API-Calls pro Tag
- Klassifizierung, Embeddings, Bulk-Processing
- Open-Weights nahe Modelle (selber hosten möglich)

## ❌ Anti-Patterns

- ❌ **Ein Modell für alles** — du verschwendest Geld oder Zeit (oder beides)
- ❌ **Teuerstes Modell automatisch wählen** — DeepSeek schlägt GPT-5.5 oft bei Routine-Tasks
- ❌ **Modelle blind tauschen** — jeder Wechsel = Prompt-Anpassung nötig
- ❌ **Benchmark-Hype glauben** — 2 % Unterschied auf SWE-bench ≠ spürbar im Alltag

## Quellen
- [SWE-bench Leaderboard](https://www.swebench.com/)
- [Aider Polyglot Leaderboard](https://aider.chat/docs/leaderboards/)
- [LM Council Benchmarks](https://lmcouncil.ai/benchmarks)

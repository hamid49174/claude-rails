# 🔄 Multi-Model Workflow End-to-End

Ein realer Workflow für ein **mittelgroßes Feature** (z.B. neuer API-Endpoint mit Tests + Frontend).

## Phasen-Übersicht

```
1. Research     →  Gemini 3.1 Pro     (Long-Context, lese Docs)
2. Planning     →  Claude Opus 4.7    (Plan-Mode, Architektur)
3. Implementation → Claude Code (Opus)  (Files schreiben, Tests)
4. Refactor    →  GPT-5.5 (Codex)    (Bash-heavy, schnelle Edits)
5. UI Review   →  Gemini 3.1 Pro     (Screenshot-Analyse)
6. Final Polish → Claude Opus 4.7    (Doku, README)
```

## Phase 1: Research (Gemini 3.1 Pro)

**Warum Gemini:** 2M Token Kontext = ich kann **die komplette Stripe-API-Doku** auf einmal reinwerfen.

```
Prompt: "Hier sind die Stripe Webhook Docs (250K Token).
Ich will Webhooks für Payment-Failed empfangen.
Was sind die Best Practices für Idempotenz, Retry und Signature-Verification?
Antworte mit Code-Beispielen in Python."
```

→ Output: detaillierte Recherche, alle Edge-Cases drin.

## Phase 2: Planning (Claude Opus 4.7, Plan Mode)

**Warum Claude:** Bestes Architektur-Reasoning, sauberer Plan-Mode.

```
> Shift+Tab (Plan Mode)
> Hier ist meine Codebase. Plane den neuen /webhooks/stripe Endpoint.
  Berücksichtige:
  - DB-Schema (welche Tabellen?)
  - Auth-Flow (Signature-Verification)
  - Tests (unit + integration)
  - Error Handling
```

→ Output: 8-Schritte-Plan, ich review und approve.

## Phase 3: Implementation (Claude Code)

**Warum:** Tool-Use, Multi-File-Edits, kann Tests sofort laufen lassen.

```
> Akzeptiere den Plan, leg los.
```

Claude:
1. Schreibt Migration
2. Schreibt Endpoint
3. Schreibt Tests
4. Lässt Tests laufen
5. Fixt Failures iterativ

## Phase 4: Refactor (GPT-5.5 via Codex CLI)

**Warum GPT-5.5:** Token-effizient, schnell für kleine Edits.

```bash
codex "rename all 'payment_failed' to 'payment_declined' across the codebase"
```

→ 30 Sekunden, fertig.

## Phase 5: UI Review (Gemini 3.1 Pro)

**Warum Gemini:** Stärkste Vision, kann UI-Screenshots wirklich verstehen.

```
[Screenshot des Dashboards anhängen]
"Was ist an dieser UI schlecht? Welche Accessibility-Probleme siehst du?
Wie würde ein Senior Designer das verbessern?"
```

## Phase 6: Final Polish (Claude Opus 4.7)

**Warum Claude:** Beste Prosa für README, Changelog, Doku.

```
> Schreibe einen sauberen README-Abschnitt für das neue Webhook-Feature.
  Zielgruppe: Junior-Devs die das integrieren wollen.
```

## Tooling-Switch — wie ich's praktisch mache

| Layer | Tool | Wo |
|---|---|---|
| Research | Gemini in Browser-Tab | aistudio.google.com |
| Planning + Implementation | Claude Code in Terminal | `claude` CLI |
| Quick Edits | Codex CLI | `codex` |
| UI/Vision | Gemini in Browser | gemini.google.com |
| Inline Completions | Copilot (Opus 4.6) | VS Code |

## Zeit & Kosten (Beispiel-Feature, Stripe Webhooks)

| Phase | Modell | Zeit | Kosten |
|---|---|---|---|
| Research | Gemini 3.1 Pro | 15 min | $0.40 |
| Planning | Claude Opus 4.7 | 10 min | $0.80 |
| Implementation | Claude Code | 45 min | $3.20 |
| Refactor | GPT-5.5 | 5 min | $0.10 |
| UI Review | Gemini 3.1 Pro | 10 min | $0.20 |
| Polish | Claude Opus 4.7 | 15 min | $0.60 |
| **Σ** | | **100 min** | **$5.30** |

→ Mit Pro/Max-Subscriptions ist das alles **flat included**.

## Anti-Pattern: "One Tool to Rule Them All"

Wenn du **nur** Cursor oder **nur** ChatGPT nutzt:
- Du verlierst 20-30 % Output-Qualität
- Bei langen Codebases verlierst du Kontext
- Bei Vision-Tasks bist du blind
- Bei Bulk-Tasks bezahlst du das 10-fache

**Lieber 2-3 Tools beherrschen als alles in einem zu zwingen.**

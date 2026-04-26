# ⚙️ Claude Code — Power User Setup

Mein persönliches Setup für **Claude Code** (Anthropic CLI mit Opus 4.7).
Optimiert für lange Sessions, Tool-Use und systematisches Arbeiten.

## 1. Installation

```bash
npm install -g @anthropic-ai/claude-code
claude --version
```

## 2. Authentifizierung

```bash
claude /login
```

Optionen:
- **Pro Plan ($20/mo)** → Flat-Rate, Opus 4.7 inklusive ← *empfohlen*
- **Max Plan ($100/mo)** → 5× Limits für Heavy User
- **API-Key** → pay-per-use, gut zum Testen

## 3. Projekt-Setup: `CLAUDE.md`

Jedes Projekt bekommt eine `CLAUDE.md` im Root — die ist Claude Code's Briefing.

**Beispiel-Skelett:**

```markdown
# Project: <Name>

## Stack
- Python 3.13, FastAPI, SQLite
- Frontend: Vanilla JS

## Konventionen
- Sprache: Deutsch in Kommentaren, Englisch im Code
- Tests: pytest, immer mit -v
- Stil: kein f-string in SQL, keine f-string in logs

## Workflow
1. Passive Analyse zuerst (lies, verstehe)
2. Dann erst editieren
3. Nach Änderung: Tests laufen lassen

## Pfade
- Python: C:\Python313\python.exe
- Tests: pytest tests/
```

## 4. Slash Commands die ich nutze

```
/init      → CLAUDE.md generieren lassen
/cost      → Token-Verbrauch checken
/clear     → Kontext leeren (bei Themenwechsel)
/compact   → Kontext zusammenfassen statt komplett verlieren
/agents    → Custom Sub-Agents verwalten
/model     → Zwischen Opus / Sonnet / Haiku wechseln
```

## 5. Mein `settings.json`

```json
{
  "permissions": {
    "allow": [
      "Bash(git status)",
      "Bash(git diff:*)",
      "Bash(npm test)",
      "Bash(pytest:*)",
      "WebFetch(domain:github.com)"
    ]
  },
  "env": {
    "BASH_DEFAULT_TIMEOUT_MS": "120000"
  }
}
```

→ Spart pro Session ~20 Permission-Prompts.

## 6. Subagents

Eigene Spezialisten in `.claude/agents/` ablegen:

```yaml
---
name: code-reviewer
description: Reviews diffs for security and style issues
tools: Read, Grep, Glob
---

Du bist ein strenger Code-Reviewer. Fokus:
1. Security (SQL-Injection, XSS, Secret-Leaks)
2. Style (Naming, DRY, KISS)
3. Tests (Coverage, Edge Cases)

Gib pro Issue: File:Line + Severity + Fix-Vorschlag.
```

Aufruf: `> @code-reviewer check the recent changes`

## 7. Best Practices

| ✅ Do | ❌ Don't |
|---|---|
| Klare CLAUDE.md pro Projekt | Generische "do something good" Prompts |
| Plan Mode für große Tasks | Direkt loslegen ohne Plan |
| `/clear` bei Themenwechsel | Endlos-Sessions ohne Reset |
| Subagents für spezielle Tasks | Alles im Hauptkontext |
| Permissions whitelisten | Jedes Mal "yes" klicken |

## 8. Tipps aus der Praxis

- **Plan-Mode (`Shift+Tab`)** vor jeder größeren Änderung — Claude darf nur lesen, kein Schreiben
- **`/cost` oft checken** — Opus kann pro Session $5+ kosten bei intensivem Tool-Use
- **Bei Bugs:** lass Claude **erst** das Problem reproduzieren, **dann** fixen
- **Lange Tasks splitten** — nach 50K Token Kontext lieber `/compact`

## Quellen
- [Claude Code Docs](https://docs.claude.com/en/docs/claude-code/overview)
- [Anthropic Engineering Blog](https://www.anthropic.com/engineering)

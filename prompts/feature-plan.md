# Feature Planning Prompt (Claude Plan Mode)

```
Wir planen ein neues Feature: {{FEATURE_NAME}}

User-Story:
{{USER_STORY}}

Bestehende Codebase: siehe Files.

Erstelle einen Implementierungs-Plan mit:

## 1. Architektur-Skizze
- Welche Components / Files / Module berührt?
- Datenfluss (User → API → DB → Response)

## 2. DB-Änderungen
- Migrations nötig? Welche?
- Indizes?

## 3. Implementierungs-Schritte (priorisiert)
- Step 1: ...
- Step 2: ...
- ...

## 4. Tests
- Unit: was muss getestet werden?
- Integration: welche Flows?

## 5. Risiken & Trade-offs
- Was könnte schiefgehen?
- Welche Annahmen mache ich?

Sei konkret mit File-Pfaden und Funktions-Namen.
KEIN Code schreiben — nur planen.
```

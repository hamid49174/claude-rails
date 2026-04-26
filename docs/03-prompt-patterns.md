# 💬 Prompt-Patterns die wirklich funktionieren

Prompts sind **Code**. Versionierbar, testbar, wiederverwendbar.

## Die 5 Pattern-Typen

### 1️⃣ Role + Task + Constraints + Format

Das Schweizer Taschenmesser. Funktioniert mit jedem Modell.

```
Du bist [ROLLE].
Aufgabe: [WAS GENAU].
Constraints:
- [LIMIT 1]
- [LIMIT 2]
Format: [WIE DIE ANTWORT AUSSEHEN SOLL]
```

**Beispiel:**
```
Du bist ein Senior Python-Entwickler.
Aufgabe: Review diese Funktion auf Bugs.
Constraints:
- Nur kritische Issues, kein Style-Bikeshedding
- Maximal 5 Punkte
Format: File:Line | Severity | Beschreibung | Fix
```

### 2️⃣ Few-Shot mit Examples

Wenn du genau eine Output-Struktur willst.

```
Klassifiziere die Sentiment-Tendenz.

Beispiel 1:
Input: "Das Produkt ist mega geil"
Output: positiv

Beispiel 2:
Input: "Hat 2 Wochen gedauert bis es ankam"
Output: negativ

Jetzt klassifiziere:
Input: "{{TEXT}}"
Output:
```

### 3️⃣ Chain-of-Thought / Schritt-für-Schritt

Bei Problemen wo Reasoning gebraucht wird.

```
Löse Schritt für Schritt:

1. Was ist das Problem?
2. Welche Optionen gibt es?
3. Welche Trade-offs hat jede Option?
4. Was ist die beste Wahl und warum?

Problem: {{PROBLEM}}
```

### 4️⃣ Selbst-Kritik (Reflexion)

Output verbessern lassen, ohne neuen Prompt.

```
[Erste Antwort hier]

Jetzt: kritisiere deine eigene Antwort.
Was fehlt? Was ist ungenau? Wo könnte ein Senior nachbohren?

Dann: schreibe die Antwort neu, mit den Verbesserungen.
```

### 5️⃣ Constraint-First (Anti-Halluzination)

Bei Fakten-Abfragen.

```
Beantworte diese Frage NUR aus den unten gelieferten Quellen.
Wenn die Antwort nicht in den Quellen steht: schreibe "Nicht in Quellen gefunden".
Erfinde NICHTS.

Quellen:
{{SOURCES}}

Frage: {{QUESTION}}
```

## ⚡ Power-Tricks

### "Think harder"
Bei Claude: das Wort **"ultrathink"** im Prompt aktiviert Extended Thinking.

### XML Tags für Struktur
Claude liebt XML:
```
<context>...</context>
<task>...</task>
<output_format>...</output_format>
```

### Negative Prompts
Sag explizit was du **nicht** willst:
```
NICHT: pip install — wir nutzen nur stdlib
NICHT: try/except als Allheilmittel — fail fast
NICHT: Kommentare die das Offensichtliche erklären
```

### Modell-Persönlichkeit fixen
```
Antworte direkt, ohne Höflichkeitsfloskeln, ohne "Sicher!", ohne Disclaimers.
```

## Anti-Patterns

| ❌ Schlecht | ✅ Besser |
|---|---|
| "Mach mir was Cooles" | "Schreibe Funktion X mit Signature Y, die Z tut" |
| "Korrigiere bitte" | "Finde Bugs in diesem Code: [code]" |
| "Erkläre mal" | "Erkläre [X] für jemanden der [Background] hat" |
| Endlos-Threads | Pro Topic neuer Chat / `/clear` |

## Mein Setup

- Wiederverwendbare Prompts → eigene Markdown-Files
- Variable Slots → `{{VARIABLE}}` Notation
- Versionierung → Git wie Code
- Top-3 Prompts → liegen als Slash-Commands in Claude Code (`.claude/commands/`)

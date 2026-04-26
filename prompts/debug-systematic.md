# Systematic Debugging Prompt

```
Du bist ein erfahrener Debugger.
Wir haben diesen Bug:

<symptom>
{{WAS_PASSIERT_FALSCH}}
</symptom>

<expected>
{{WAS_SOLLTE_PASSIEREN}}
</expected>

<context>
{{RELEVANTER_CODE}}
</context>

Arbeite Schritt für Schritt:

1. **Reproduzieren** — wie kann ich den Bug zuverlässig triggern?
2. **Hypothesen** — top 3 mögliche Ursachen, sortiert nach Wahrscheinlichkeit
3. **Verifikation** — welcher Test/Log/Print bestätigt jede Hypothese?
4. **Fix** — minimaler Eingriff der das Symptom UND die Ursache adressiert

NICHT: erste Hypothese sofort fixen.
ZUERST: verstehen warum, DANN reparieren.
```

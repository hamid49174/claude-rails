---
description: Walk through unfamiliar code with concrete file:line references.
argument-hint: <symbol, file, or behavior to explain>
---

Explain the following, grounded in the actual code:

$ARGUMENTS

## Format

1. **What it does** — one paragraph, no jargon.
2. **Where it lives** — file:line for the entry point.
3. **How it's wired** — what calls it, what it calls. Bullet list with file:line.
4. **Surprises** — anything non-obvious a new reader would trip on.

## Rules

- Quote actual code. Do not paraphrase logic.
- If the answer requires reading more than 5 files, list them and ask which the user wants prioritized.
- Do not invent abstractions ("it's basically a factory") that the code does not use.

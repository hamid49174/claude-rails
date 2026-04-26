# Project Briefing

This file is loaded into every Claude Code session in this repo. Keep it short, keep it accurate. If a section is wrong, fix it — drift here costs more than it saves.

## What this is

<one or two sentences>

## Stack

- Language: <Python 3.13 / Node 20 / Go 1.22 / ...>
- Framework: <FastAPI / Next.js / Django / ...>
- Database: <Postgres 16 / SQLite / ...>
- Tests: <pytest / vitest / go test>
- Lint/format: <ruff + black / eslint + prettier / ...>

## Layout

```
src/        # production code
tests/      # mirror src/ structure
scripts/    # one-shot tools, not imported
docs/       # human-facing docs
```

## Conventions

- <one rule>
- <one rule>
- <one rule>

## Run it

```bash
<install>
<dev server>
<tests>
```

## What not to touch

- `<path>` — <reason>
- `<path>` — <reason>

## Subagents available

- `planner` — for any change > 1 file
- `code-reviewer` — before every commit
- `debugger` — on test failure
- `security-auditor` — when touching auth, input, SQL, files
- `refactor-surgeon` — for behavior-preserving cleanups
- `doc-writer` — after a feature lands

## Slash commands

- `/plan <description>` — produce a plan, no code
- `/review` — review the current diff
- `/debug <error>` — diagnose a failure
- `/audit` — security review of the diff
- `/ship` — lint → test → review → commit → push
- `/explain <thing>` — walk through unfamiliar code

# Project Briefing

A FastAPI backend serving a typed JSON API. Postgres for persistence, Redis for rate limiting and queues.

## Stack

- Python 3.13
- FastAPI 0.115, Pydantic v2, SQLAlchemy 2 (async)
- Postgres 16 (asyncpg), Redis 7
- Tests: pytest + pytest-asyncio + httpx
- Lint/format: ruff (lint + format), mypy strict

## Layout

```
src/app/
├── api/            # routers, one file per resource
├── core/           # config, security, deps
├── db/             # models, migrations (alembic)
├── schemas/        # Pydantic request/response models
├── services/       # business logic, no FastAPI imports
└── main.py
tests/              # mirrors src/app/
scripts/            # one-shot CLI tools
```

## Conventions

- Routers depend on services. Services never import from `api/`.
- Every endpoint returns a Pydantic model, never a raw dict.
- Async all the way down. No sync DB calls.
- DB sessions come from a dependency, not module-level.
- No business logic in migrations.

## Run it

```bash
uv sync
docker compose up -d postgres redis
uv run alembic upgrade head
uv run uvicorn app.main:app --reload
uv run pytest
```

## What not to touch

- `src/app/db/migrations/` — append only, never edit past migrations
- `src/app/core/config.py` env loading — change requires updating `.env.example` in the same commit

## Subagents

- `planner`, `code-reviewer`, `debugger`, `security-auditor`, `refactor-surgeon`, `doc-writer`

## Slash commands

- `/plan`, `/review`, `/debug`, `/audit`, `/ship`, `/explain`

---
description: Lint → test → review → commit → push. Every gate must pass.
argument-hint: <optional commit message>
---

Ship the current changes. Run the gates in order. Stop and report on the first failure.

## Gate 1 — Lint
Detect the linter from the project (`ruff`, `eslint`, `golangci-lint`, etc.). Run it. Must pass.

## Gate 2 — Tests
Detect the test runner (`pytest`, `npm test`, `go test ./...`, etc.). Run it. Must pass.

## Gate 3 — Review
Hand off to the `code-reviewer` subagent. If the agent reports anything other than `LGTM`, stop.

## Gate 4 — Commit
- Stage tracked changes only (`git add -u`). Never `-A`.
- Use the message from $ARGUMENTS if provided.
- Otherwise generate one from the diff: imperative mood, under 72 chars, no period.

## Gate 5 — Push
Push to the current branch's upstream. If no upstream is configured, ask before setting it.

## Rules

- One failing gate stops the pipeline. Do not skip ahead.
- Do not commit if the diff contains `.env`, `*.key`, or any file matching the secret-scanner ruleset.
- Never use `--no-verify` to bypass hooks.

# claude-code-workflow

Opinionated Claude Code setup — plug-and-play subagents, slash commands, and project templates.

Drop the `.claude/` directory into any repo and Claude Code immediately knows how to plan, review, debug, and ship code the way you want it to.

## What's in here

```
.claude/
├── agents/        # specialized subagents Claude delegates to
├── commands/      # slash commands you invoke directly
└── hooks/         # event hooks (pre-commit, post-tool-use)
templates/
├── CLAUDE.md      # project briefing skeleton
└── settings.json  # permissions + env defaults
examples/
└── python-fastapi/  # CLAUDE.md tuned for a real stack
```

## Install

```bash
git clone https://github.com/hamid49174/ai-workflow ~/.claude-workflow
cp -r ~/.claude-workflow/.claude /your/project/
cp ~/.claude-workflow/templates/CLAUDE.md /your/project/
cp ~/.claude-workflow/templates/settings.json /your/project/.claude/
```

Restart Claude Code in the project. Run `/help` and the new commands appear under Project.

## Subagents

| Agent | Purpose | When Claude delegates |
|---|---|---|
| `planner` | Decompose a feature into ordered steps | before any non-trivial change |
| `code-reviewer` | Review a diff for bugs and security issues | after `git add`, before commit |
| `debugger` | Reproduce → hypothesize → verify → fix | on test failure or runtime bug |
| `security-auditor` | Find OWASP-class issues in a diff | on touch of auth, input, or DB code |
| `refactor-surgeon` | Move code without behavior change | when scope is "clean up X" |
| `doc-writer` | Draft README / changelog / migration notes | after a feature lands |

Each agent is a single Markdown file in `.claude/agents/` — read them, edit them, fork them. No magic.

## Slash commands

| Command | What it does |
|---|---|
| `/plan` | Enter plan mode, route to `planner` agent, output a numbered plan |
| `/review` | Run `code-reviewer` on the current diff |
| `/debug` | Hand the failing test/error to `debugger` |
| `/ship` | Lint → test → review → commit → push (all gates must pass) |
| `/audit` | Run `security-auditor` over the staged diff |
| `/explain` | Walk through unfamiliar code with line refs |

## Why this exists

Claude Code is powerful but generic out of the box. Most teams spend weeks rediscovering the same patterns:

1. one CLAUDE.md per project, always with the same sections
2. a planner that runs in plan mode before it writes code
3. a reviewer that catches the same five mistakes every time
4. a debugger that doesn't fix the symptom and call it done

This repo is the version of those patterns I actually use. It's small on purpose. If a piece of it doesn't earn its place after a week, it gets deleted.

## Compatibility

- Claude Code ≥ 2.0 (slash command + subagent format, settings.json schema)
- Works alongside Cursor / Codex CLI — `.claude/` is namespaced

## License

MIT.

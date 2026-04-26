# Hooks

Claude Code event hooks. Each is a shell command run by the harness on a specific event.

Configure them in `.claude/settings.json` under `hooks`. Examples:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          { "type": "command", "command": ".claude/hooks/secret-scan.sh" }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          { "type": "command", "command": ".claude/hooks/format-on-save.sh" }
        ]
      }
    ]
  }
}
```

## Conventions for hooks in this repo

- Exit 0 to allow, exit 2 to block with a message Claude reads.
- Hooks are checked into the repo, not generated. Reviewable by humans.
- Keep them under 30 lines. If a hook needs more logic, it should be a script the hook calls.

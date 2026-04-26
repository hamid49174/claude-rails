#!/usr/bin/env bash
# Block Bash calls that would commit obvious secrets.
# Wired into settings.json under hooks.PreToolUse with matcher "Bash".
# Reads the proposed tool input on stdin, exits 2 to block.

set -euo pipefail

input=$(cat)
cmd=$(printf '%s' "$input" | python -c 'import json,sys;print(json.load(sys.stdin).get("tool_input",{}).get("command",""))' 2>/dev/null || true)

# Only inspect git commit / git add commands.
case "$cmd" in
  *"git commit"*|*"git add"*) ;;
  *) exit 0 ;;
esac

# Look at what would be staged/committed.
diff_to_scan=$(git diff --cached 2>/dev/null || true)
[ -z "$diff_to_scan" ] && diff_to_scan=$(git diff 2>/dev/null || true)
[ -z "$diff_to_scan" ] && exit 0

# Patterns that should never land in a commit.
patterns='(AKIA[0-9A-Z]{16}|ghp_[A-Za-z0-9]{36}|sk-[A-Za-z0-9]{32,}|xox[baprs]-[A-Za-z0-9-]+|-----BEGIN (RSA |EC |OPENSSH |)PRIVATE KEY-----|password\s*=\s*["'"'"'][^"'"'"']{6,})'

if printf '%s' "$diff_to_scan" | grep -E -i -q "$patterns"; then
  echo "secret-scan: refused. The diff contains a string that looks like a secret." >&2
  echo "Run: git diff --cached | grep -E -i '$patterns'" >&2
  exit 2
fi

exit 0

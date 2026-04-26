#!/usr/bin/env bash
# Block bash commands that are almost always a mistake.
# Wired into settings.json under hooks.PreToolUse with matcher "Bash".

set -euo pipefail

input=$(cat)
cmd=$(printf '%s' "$input" | python -c 'import json,sys;print(json.load(sys.stdin).get("tool_input",{}).get("command",""))' 2>/dev/null || true)

block() {
  echo "no-dangerous-bash: refused — $1" >&2
  exit 2
}

# rm -rf on root or home
echo "$cmd" | grep -E -q 'rm[[:space:]]+-rf?[[:space:]]+(/|~|\$HOME)([[:space:]]|$)' && block "rm -rf on / or \$HOME"

# git push --force without explicit branch
echo "$cmd" | grep -E -q 'git[[:space:]]+push[[:space:]]+(--force|-f)([[:space:]]|$)' && block "git push --force without an explicit branch"

# History rewrites
echo "$cmd" | grep -E -q 'git[[:space:]]+(reset[[:space:]]+--hard|filter-branch|filter-repo)' && block "git history rewrite — confirm with the user first"

# Skipping commit hooks
echo "$cmd" | grep -E -q '\-\-no-verify' && block "--no-verify bypasses commit hooks"

# Curl pipe shell
echo "$cmd" | grep -E -q '(curl|wget)[^|]*\|[[:space:]]*(bash|sh|zsh)' && block "curl | sh — fetch the script first, read it, then run it"

exit 0

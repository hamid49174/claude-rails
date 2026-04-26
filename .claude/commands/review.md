---
description: Run the code-reviewer subagent on the current diff.
---

Hand off to the `code-reviewer` subagent.

Context for the agent:
- Run `git diff --staged`. If empty, run `git diff` instead.
- If both are empty, report "no changes to review" and stop.

Do not commit. Do not stage. Do not edit. Review only.

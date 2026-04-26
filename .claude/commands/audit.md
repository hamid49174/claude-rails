---
description: Run the security-auditor subagent over the staged diff.
---

Hand off to the `security-auditor` subagent.

Scope: only the diff (staged, then unstaged, then last commit if both empty).
Output the agent's standard CRITICAL/HIGH/MEDIUM/LOW report.

If risk is CRITICAL or HIGH, do not proceed to commit until the issue is fixed or explicitly accepted.

#!/usr/bin/env python3
"""Validate that every agent and command file in .claude/ is well-formed.

Run: python scripts/validate.py
Exits 0 if everything is valid, 1 otherwise. CI-friendly.
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
AGENTS = ROOT / ".claude" / "agents"
COMMANDS = ROOT / ".claude" / "commands"

REQUIRED_AGENT_KEYS = ("name", "description", "tools")
REQUIRED_COMMAND_KEYS = ("description",)


def parse_frontmatter(text: str) -> dict[str, str] | None:
    """Return frontmatter as dict, or None if not present/malformed."""
    if not text.startswith("---\n"):
        return None
    end = text.find("\n---\n", 4)
    if end == -1:
        return None
    body = text[4:end]
    out: dict[str, str] = {}
    for line in body.splitlines():
        if ":" not in line:
            continue
        key, _, value = line.partition(":")
        out[key.strip()] = value.strip()
    return out


def check(file: Path, required: tuple[str, ...]) -> list[str]:
    issues: list[str] = []
    fm = parse_frontmatter(file.read_text(encoding="utf-8"))
    if fm is None:
        issues.append(f"{file}: missing or malformed YAML frontmatter")
        return issues
    for key in required:
        if key not in fm or not fm[key]:
            issues.append(f"{file}: missing '{key}' in frontmatter")
    if "name" in fm and fm["name"] != file.stem:
        issues.append(
            f"{file}: name '{fm['name']}' does not match filename '{file.stem}'"
        )
    return issues


def main() -> int:
    issues: list[str] = []
    agent_files = sorted(AGENTS.glob("*.md"))
    command_files = sorted(COMMANDS.glob("*.md"))

    if not agent_files:
        issues.append(f"{AGENTS}: no agents found")
    if not command_files:
        issues.append(f"{COMMANDS}: no commands found")

    for f in agent_files:
        issues.extend(check(f, REQUIRED_AGENT_KEYS))
    for f in command_files:
        issues.extend(check(f, REQUIRED_COMMAND_KEYS))

    if issues:
        print("FAIL")
        for i in issues:
            print(" -", i)
        return 1

    print(f"OK  {len(agent_files)} agents, {len(command_files)} commands")
    return 0


if __name__ == "__main__":
    sys.exit(main())

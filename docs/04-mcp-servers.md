# 🔌 MCP Server Stack

**Model Context Protocol (MCP)** = standardisiertes Plugin-System für KI-Assistenten.
Statt jedes Tool selber zu coden → einmal konfigurieren, überall nutzen.

## Was ist MCP?

```
┌─────────────┐    ┌──────────┐    ┌──────────────┐
│ Claude Code │───→│   MCP    │───→│  Tool / API  │
│   GPT-5.5   │    │  Server  │    │  (Slack, DB, │
│   Cursor    │    │          │    │   Files...)  │
└─────────────┘    └──────────┘    └──────────────┘
```

Ein MCP Server = ein Set von Tools, das jeder KI-Client nutzen kann.

## Meine Standard-Server

| Server | Zweck | Wann ich's nutze |
|---|---|---|
| **filesystem** | Files lesen/schreiben | Immer (Default) |
| **github** | Repos, Issues, PRs verwalten | Code-Reviews, PR-Workflow |
| **fetch** | Web-Pages laden | Recherche, Doku-Lookup |
| **sqlite** | Lokale DB queryen | Daten-Analyse |
| **playwright** | Browser-Automation | Scraping, E2E-Tests |
| **memory** | Persistent Context | Lange Projekte |

## Setup-Beispiel (Claude Code)

`~/.config/claude-code/mcp_servers.json`:

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/projects"]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_xxx"
      }
    },
    "fetch": {
      "command": "uvx",
      "args": ["mcp-server-fetch"]
    }
  }
}
```

## Auswahl-Kriterien

✅ **Nimm einen MCP Server wenn:**
- Du das Tool **mehrfach pro Woche** brauchst
- Es eine **stabile API** hat (Authentication etc.)
- Es **lokal läuft** oder die Auth-Story klar ist

❌ **Skip wenn:**
- Du's einmal pro Monat brauchst → einfacher Bash-Call
- Es jeden Tag das Schema ändert
- Es fragwürdig auth'd (privater API-Key per Default)

## Wichtige Sicherheitsregeln

1. **Nie API-Keys in Configs committen** — `.env` + `.gitignore`
2. **Permissions minimal** — z.B. `filesystem` nur auf Project-Root, nicht `/`
3. **Logs prüfen** — `~/.claude/logs/` zeigt was MCP wirklich tut
4. **Untrusted Servers vermeiden** — nur offizielle / open-source MCP Server

## Eigenen MCP Server bauen

Einfachster Weg: **Python + `mcp` package** oder **Node + `@modelcontextprotocol/sdk`**.

Boilerplate (Python):
```python
from mcp.server import Server
from mcp.types import Tool, TextContent

server = Server("my-tool")

@server.list_tools()
async def list_tools():
    return [Tool(name="hello", description="Greets", inputSchema={...})]

@server.call_tool()
async def call_tool(name, arguments):
    return [TextContent(type="text", text="Hello!")]
```

## Quellen
- [MCP Spec](https://spec.modelcontextprotocol.io/)
- [MCP Server Registry](https://github.com/modelcontextprotocol/servers)

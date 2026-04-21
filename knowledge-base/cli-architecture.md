---
id: cli-architecture
type: knowledge
tags: ["#architecture", "#cli"]
links: ["[[MAP]]", "[[AGENT]]"]
---

# CLI Architecture: agnman

## Overview
`agnman` is a CLI tool to manage agent resources via symlinks. It aims to solve the problem of duplicating skills and rules across multiple repositories.

## Path Management (XDG)
The tool will follow the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html).
- **Global Database**: `$XDG_DATA_HOME/agnman/` (defaults to `~/.local/share/agnman/`).
  - `/skills/`: Stores global skill folders.
  - `/rules/`: Stores global rule files/folders.

## Command Structure
The CLI uses a `noun verb` pattern:

### Skill Management
- `agnman skill create --source <dir>`: 
  - Validates `<dir>` exists.
  - Moves it to `~/.local/share/agnman/skills/`.
  - Prompts to replace original with symlink.
- `agnman skill link <name>`:
  - Detects `.agents/` or `.claude/`.
  - Creates symlink from global DB to local dir.
- `agnman skill list`: Lists available global skills.

### Rule Management
- `agnman rule create --source <file>`: Moves to `~/.local/share/agnman/rules/`.
- `agnman rule link <name>`: Links to local `.agents/rules/`.

## Argument Parsing
For the Bash MVP, we will use a simple `case` statement loop to handle subcommands and flags.

## Security & Safety
- **Dry Run**: Optional `--dry-run` flag.
- **Overwrites**: Always prompt before overwriting a non-symlink folder.
- **Path Resolution**: Use `realpath` to ensure symlinks are correctly pointed.

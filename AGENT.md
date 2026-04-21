---
id: AGENT
type: index
links: [MAP]
---

# Agent Instructions: Project agnman

You are assisting in the development of `agnman`, a CLI tool designed to centralize and manage AI agent resources (skills and rules) across multiple development projects using Linux symbolic links.

## The Two-Layer Principle
This repository follows a strict separation of knowledge and code to prevent folder hierarchy paralysis:
- **Knowledge Layer:** All documentation, prompt designs, and architectural decisions live in `knowledge-base/` as flat `.md` files, linked via YAML frontmatter.
- **Code Layer:** The actual CLI implementation lives in `src/`, structured by technical requirements.

## How to navigate this project
- Read `MAP.md` when you need to find a related note or create a new one. (Create it if it doesn't exist).
- Before reading any note fully, read its **frontmatter first (first 5 lines)** to determine if it is relevant to your current task.

## Node Frontmatter Syntax
Every `.md` file in `knowledge-base/` must start with this block:
```yaml
---
id: node-filename
type: [knowledge | template | skill | task | index]
tags: ["#tag1"]
links: ["[[related-node]]"]
---
```

## Project Requirements (The MVP)
`agnman` is a terminal command that manages symlinks between a global database and local `.claude/` or `.agents/` folders.
1. **Global DB:** Manages skills and rules in a central system folder (e.g., `~/.local/share/agnman/`).
2. **Commands:**
   - `agnman skill/rule create --source <dir>`: Moves a local skill/rule folder to the global DB and asks the user if they want to replace the local hard folder with a symlink `[Y/n]`.
   - `agnman skill/rule edit <name>`: Opens the global folder/file in the user's preferred text editor.
   - `agnman skill/rule delete <name>`: Deletes from the global DB.
   - `agnman skill link <name>`: Detects `.claude/` or `.agents/` in the current dir. If both exist, prompts which to link to (or all). Warns and prompts before overwriting existing files.
   - `agnman skill unlink <name>`: Removes the local symlink.
   - `agnman skill/rule list`: Lists registered skills/rules.
3. **Tech Stack:** Bash script (MVP) or Python/Rust if path resolving and prompt handling get too complex for standard shell scripting.

## Your First Tasks
1. Initialize `MAP.md` following the standard Zettelkasten index format.
2. Create a `knowledge-base/cli-architecture.md` defining the command structures, argument parsing approach, and XDG base directory paths to be used.
3. Update `MAP.md` to reflect these new nodes.
4. Wait for the user's approval on the architecture before writing the first scripts in `src/`.
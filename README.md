# agnman 🤖

**agnman** (Agent Manager) is a CLI tool designed to centralize and manage AI agent resources—specifically **skills** and **rules**—across multiple development projects using Linux symbolic links.

It solves the problem of "folder hierarchy paralysis" and redundant manual copying by maintaining a global database of agent resources and linking them into your local project's `.agents/` or `.claude/` directories.

## 🚀 Key Features

- **Global Database**: Store your best agent prompts, tools, and rules in a central location (`~/.local/share/agnman/`).
- **Smart Linking**: Automatically detects `.agents/` or `.claude/` folders in your current project and links resources there.
- **Zettelkasten-First**: Built with a strict separation of **Knowledge** (documentation and prompt design) and **Code** (CLI implementation).
- **Bash-Powered**: Lightweight and fast, following the XDG Base Directory Specification.

## 🛠️ Installation

To use `agnman` from anywhere, create a symlink to your local bin directory:

1. **Create the symlink**:
   ```bash
   ln -s "$(realpath src/agnman)" ~/.local/bin/agnman
   ```

2. **Ensure `~/.local/bin` is in your PATH**:
   Add the following to your `~/.bashrc` or `~/.zshrc`:
   ```bash
   export PATH="$HOME/.local/bin:$PATH"
   ```
   Then reload: `source ~/.bashrc` (or `~/.zshrc`).

## 📖 Usage

`agnman` follows a `noun verb` pattern for its commands.

### Skill Management
Manage modular agent capabilities (skills).
- `agnman skill create --source <dir>`: Moves a local skill folder to the global DB and replaces it with a symlink.
- `agnman skill link <name>`: Links a global skill into the current project.
- `agnman skill unlink <name>`: Removes the local symlink for a skill.
- `agnman skill list`: Lists all available global skills.
- `agnman skill edit <name>`: Opens the global skill folder in your default editor.
- `agnman skill delete <name>`: Removes the skill from the global DB.

### Rule Management
Manage system prompts and behavioral rules.
- `agnman rule create --source <file>`: Moves a local rule file to the global DB.
- `agnman rule link <name>`: Links a global rule into the current project's `rules/` folder.
- `agnman rule unlink <name>`: Removes the local symlink for a rule.
- `agnman rule list`: Lists all available global rules.
- `agnman rule delete <name>`: Removes the rule from the global DB.

## 🏗️ Project Architecture

This repository follows the **Two-Layer Principle**:

1.  **Knowledge Layer (`knowledge-base/`)**: Flat Markdown files following a Zettelkasten structure. Contains architectural decisions, task tracking, and prompt designs.
2.  **Code Layer (`src/`)**: The functional CLI implementation.

### Navigation
- **MAP.md**: The entry point for the knowledge base.
- **AGENT.md**: Core operating principles and instructions for AI assistants.

## 📂 Paths
Following the XDG spec, `agnman` stores data in:
- `Global Data`: `$XDG_DATA_HOME/agnman/` (defaults to `~/.local/share/agnman/`)
    - `/skills/`: Global skill folders.
    - `/rules/`: Global rule files/folders.

---
Built for high-performance AI-assisted coding workflows.

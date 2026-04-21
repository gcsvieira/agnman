# agnman

**agnman** (agent-manager) is a cli tool designed to centralize and manage ai agent resources (specifically **skills** and **rules**) across multiple development projects. This is achieved by using linux symbolic links.

it solves the problem of copying and pasting the same skill multiple times throughout multiple projects by maintaining a global database of resources.

currently it supports google's antigravity and claude-code by verifying the existence of `.agents/` and `.claude/`.

##  key features

- store your agent prompts, tools, and rules in a central location (`~/.local/share/agnman/`).
- automatically detects `.agents/` and/or `.claude/` folders in your current project and links resources there.
- at its core, it is a lightweight and fast bash script.
- uses `tree` for hierarchical listing (optional).

## installation:
### automated (recommended):
run the bootstrap command directly:
```bash
curl -fsSL https://raw.githubusercontent.com/gcsvieira/agnman/master/setup.sh | bash
```
*note: this will download the agnman script to `~/.local/bin/`. if you run it from a local clone, it will automatically symlink your local code instead.*

the setup was designed to be idempotent, meaning you can run it multiple times.

### manual
1. **clone the repo and create the symlink**:
   ```bash
   ln -s "$(realpath src/agnman)" ~/.local/bin/agnman
   ```

2. **ensure `~/.local/bin` is in your PATH**:
   add `export PATH="$HOME/.local/bin:$PATH"` to your shell config.

## usage

`agnman` follows a `noun verb` pattern for its commands.

### typical workflow
1.  create your skill or rule inside your current project (e.g., `.agents/skills/my-new-skill/`). add your `SKILL.md`, examples, and scripts.
2.  once it's ready, run `agnman skill create --source .agents/skills/my-new-skill`. this moves it to your global database and replaces the local folder with a symlink.
3.  in a different project, run `agnman skill link my-new-skill` to bring that capability into your project instantly.

### skill management
manage modular agent capabilities (skills).
- `agnman skill create --source <dir>`: moves a local skill folder to the global DB and replaces it with a symlink.
- `agnman skill link <name>`: links a global skill into the current project.
- `agnman skill unlink <name>`: removes the local symlink for a skill.
- `agnman skill list [pattern] [--tree]`: lists global skills, optionally filtering by pattern or showing a tree view.
- `agnman skill edit <name>`: opens the global skill folder in your default editor.
- `agnman skill delete <name>`: removes the skill from the global DB.

### rule management
manage system prompts and behavioral rules.
- `agnman rule create --source <file>`: moves a local rule file to the global DB.
- `agnman rule link <name>`: links a global rule into the current project's `rules/` folder.
- `agnman rule unlink <name>`: removes the local symlink for a rule.
- `agnman rule list [pattern] [--tree]`: lists global rules, optionally filtering by pattern or showing a tree view.
- `agnman rule delete <name>`: removes the rule from the global DB.

## project architecture

this repository follows the **two-layer principle**:

1.  **knowledge layer (knowledge-base/)**: flat markdown files following a zettelkasten structure. contains architectural decisions, task tracking, and prompt designs.
2.  **code layer (src/)**: the functional cli implementation.

### navigation
- **MAP.md**: the entry point for the knowledge base.
- **AGENT.md**: core operating principles and instructions for ai assistants.

## paths
following the XDG spec, `agnman` stores data in:
- `global data`: `$XDG_DATA_HOME/agnman/` (defaults to `~/.local/share/agnman/`)
    - `/skills/`: global skill folders.
    - `/rules/`: global rule files/folders.

---
built for high-performance ai-assisted coding workflows.

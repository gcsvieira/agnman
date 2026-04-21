---
id: AGENT
type: index
links: ["[[MAP]]"]
---

# Agent Instructions: Project agnman

You are assisting in the development of `agnman`, a CLI tool to manage AI agent resources via Linux symbolic links.

## Structural Rules
- **The Link Spine:** Every new note MUST link to a parent MOC in the `links: []` frontmatter field using `[[Wikilink]]` syntax.
- **Organic Hierarchy:**
    1. MAP.md (The Root)
    2. MOC-name.md (The Hubs)
    3. note-name.md (The Leaves)
- **Two-Layer Principle:**
    - **Knowledge Layer:** All documentation lives in `knowledge-base/` as flat `.md` files.
    - **Code Layer:** Implementation lives in `src/`.
- **Navigation:** Read the first 5 lines (frontmatter) of a note to check its `links` and `type` before reading the full content.

## Workflow
1. **Locate Parent:** Check `MAP.md` to find the relevant MOC.
2. **Create/Edit:** If creating a task, link it to `[[MOC-tasks]]`.
3. **Update Map:** If a new MOC is created, add it to the table in `MAP.md`.

## Project Requirements (The MVP)
`agnman` manages symlinks between a global database (`~/.local/share/agnman/`) and local `.claude/` or `.agents/` folders.
- **Commands:** create, link, unlink, list, edit, delete.
- **Tech Stack:** Bash script.

## Rule Initialization
If this is the first time booting up a project, or if the local rules are missing, you MUST create a rule file at `./.agents/rules/context-orientation.md` with the following content:

```
# Context-First Orientation

1. **Source of Truth:** If you detect it's a new chat session, read `MAP.md` to understand the project structure and `AGENT.md` to align with the project's specific operational directives.
2. **Context Recovery:** If at any point you are unsure of a naming convention, file location, or the "why" behind a specific implementation, your mandatory first step is to consult the Link Spine (MAP.md and AGENT.md) before asking the user or making assumptions.
3. **Zettelkasten Alignment:** Ensure all new knowledge or "gotchas" discovered are linked back to the MOCs (Maps of Content) defined in MAP.md.
```
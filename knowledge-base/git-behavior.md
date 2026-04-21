---
id: git-behavior
type: knowledge
tags: ["#git", "#symlinks"]
links: ["[[MOC-architecture]]"]
---

# Git and Symlinks

A common question when using `agnman` is: **How does Git handle these symlinks?**

## The Short Answer
Yes, Git tracks symlinks. However, it tracks them **as pointers**, not as the content they point to.

## Detailed Behavior
1. **Pointers, not Content**: When you `git add` a symlink, Git stores the text path of the destination (e.g., `/home/user/.local/share/agnman/skills/my-skill`). It does **not** follow the link to upload the files inside the global database.
2. **Portability**:
   - If another developer clones your repo, they will get the symlink exactly as you committed it.
   - If they have `agnman` installed and the same skill name in their global database, the link will "just work."
   - If they **don't** have that skill, the link will be **broken** (pointing to a non-existent path).
3. **Cross-Platform**: Git handles symlinks on Linux and macOS natively. On Windows, it depends on the user's Git configuration (`core.symlinks`), but generally, it's safer to assume symlinks are for Unix-like environments in this project.

## Why this is good for `agnman`
This behavior enforces the **separation of concerns**:
- The repository tracks **which** skills it needs.
- The user's global database provides the **implementation** of those skills.
- This prevents "bloating" repositories with duplicate skill files.

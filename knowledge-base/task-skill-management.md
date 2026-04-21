---
id: task-skill-management
type: task
status: completed
tags: ["#task", "#cli"]
links: ["[[MAP]]", "[[cli-architecture]]"]
---

# Task: Skill Management (Create/Link)

## Status
- [x] Implement `skill create` to move local skills to global DB.
- [x] Implement `skill link` to link global skills to projects.
- [x] Auto-detection of `.agents` and `.claude` directories.
- [x] Symlink replacement and overwrite protection.
- [x] Path normalization using `realpath`.

## Implementation Details
Skills are stored in `$XDG_DATA_HOME/agnman/skills/`. The tool handles moving folders to this global storage and linking them back to the appropriate project subdirectories.

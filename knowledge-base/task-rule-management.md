---
id: task-rule-management
type: task
status: completed
tags: ["#task", "#cli"]
links: ["[[MOC-tasks]]"]
---

# Task: Implement Rule Management

## Status
- [x] Implement `rule create` to move local rules to global DB.
- [x] Implement `rule link` to link global rules to local projects.
- [x] Implement `rule unlink` to remove local symlinks.
- [x] Support both files and directories as rules.
- [x] Test with `dummy-rule.md`.

## Implementation Details
Rules are handled similarly to skills but stored in `$XDG_DATA_HOME/agnman/rules/`. They are linked into the `rules/` subdirectory of the detected agent folder.

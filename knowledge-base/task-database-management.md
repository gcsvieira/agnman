---
id: task-database-management
type: task
status: in-progress
tags: ["#task", "#cli"]
links: ["[[MOC-tasks]]"]
---

# Task: Database Management (List/Edit/Delete)

## Status
- [x] Implement `skill/rule list` to view global DB.
- [ ] Support `skill/rule list <pattern>` for partial name matching (search).
- [ ] Standardize `list` output to one-line names by default.
- [ ] Support `skill/rule list --tree` for hierarchical view.
- [ ] Support combining search and tree view: `list <pattern> --tree`.
- [x] Implement `skill/rule edit <name>` to open in editor.
- [x] Implement `skill/rule delete <name>` to remove from global DB.

## Implementation Details
The `list` command scans the `$XDG_DATA_HOME/agnman/` subdirectories. 
- Search should use `grep` or bash pattern matching.
- Tree view can leverage the `tree` command (if available) or a manual recursive function.

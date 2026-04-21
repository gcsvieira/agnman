---
id: task-database-management
type: task
status: in-progress
tags: ["#task", "#cli"]
links: ["[[MAP]]", "[[cli-architecture]]"]
---

# Task: Database Management (List/Edit/Delete)

## Status
- [x] Implement `skill/rule list` to view global DB.
- [x] Implement `skill/rule edit <name>` to open in editor.
- [x] Implement `skill/rule delete <name>` to remove from global DB.

## Implementation Details
The `list` command simply scans the `$XDG_DATA_HOME/agnman/` subdirectories and prints the entries.

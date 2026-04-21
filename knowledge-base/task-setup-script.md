---
id: task-setup-script
type: task
status: completed
tags: ["#task", "#installation"]
links: ["[[MOC-tasks]]"]
---

# Task: Create Setup Script

## Description
Create a bootstrap script (`setup.sh`) to automate the installation and initial configuration of `agnman`.

## Requirements
- Automatically create the XDG data directories (`~/.local/share/agnman/skills` and `rules`).
- Handle symlinking the `agnman` script to `~/.local/bin/`.
- Check if `~/.local/bin` is in the user's `$PATH`.
- Provide clear instructions for manual shell configuration if needed.

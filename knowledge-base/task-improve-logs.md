---
id: task-improve-logs
type: task
status: completed
tags: ["#task", "#ux"]
links: ["[[MOC-tasks]]"]
---

# Task: Improve CLI Logging

## Description
Current logs use colorful prefixes like `[INFO]`, `[ERROR]`, and `[SUCCESS]`. The goal is to simplify these to provide a cleaner terminal experience.

## Requirements
- Remove `[INFO]`, `[SUCCESS]`, etc.
- Use simple, direct messages (e.g., "Skill linked successfully.")
- Keep colors for errors but simplify the text.
- Ensure messages are consistent across all commands.

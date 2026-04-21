# Skill: Zettelkasten Knowledge Management

## Context
Maintaining a flat-file knowledge base with bi-directional linking and YAML frontmatter.

## Frontmatter Requirements
Every note must start with:
```yaml
---
id: filename
type: [knowledge | template | skill | task | index]
tags: ["#tag"]
links: ["[[related-node]]"]
---
```

## Navigation Patterns
- **MAP.md**: The entry point. Update it whenever a new major node is created.
- **Bi-directional Links**: If Note A links to Note B, consider if Note B should link back to Note A.
- **Flat Hierarchy**: All files go in `knowledge-base/` without subdirectories to avoid "folder paralysis".

## File Naming
- Use kebab-case for filenames.
- Filename must match the `id` in frontmatter.

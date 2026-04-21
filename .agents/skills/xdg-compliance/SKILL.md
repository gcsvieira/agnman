# Skill: XDG Compliance

## Context
Adhering to the XDG Base Directory Specification for Linux applications.

## Standards

### Data Storage
- Use `${XDG_DATA_HOME:-$HOME/.local/share}/agnman` for persistent data (skills, rules).

### Configuration
- Use `${XDG_CONFIG_HOME:-$HOME/.config}/agnman` for user preferences.

### Cache
- Use `${XDG_CACHE_HOME:-$HOME/.cache}/agnman` for temporary files or index caches.

## Patterns (Bash)
```bash
DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/agnman"
mkdir -p "$DATA_DIR/skills" "$DATA_DIR/rules"
```

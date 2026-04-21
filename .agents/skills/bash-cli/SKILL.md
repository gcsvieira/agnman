# Skill: Bash CLI Patterns

## Context
Used for creating robust Bash-based CLI tools with subcommands and flags.

## Patterns

### Subcommand Handling
```bash
case "$1" in
    skill)
        shift
        # Handle skill subcommands
        ;;
    rule)
        shift
        # Handle rule subcommands
        ;;
    *)
        echo "Usage: agnman {skill|rule} ..."
        exit 1
        ;;
esac
```

### Argument Parsing (Flags)
```bash
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --source) source_dir="$2"; shift ;;
        --dry-run) dry_run=true ;;
        *) echo "Unknown parameter: $1"; exit 1 ;;
    esac
    shift
done
```

### Error Handling
- Use `set -euo pipefail`.
- Use `if ! command; then ...; fi` for critical path checks.

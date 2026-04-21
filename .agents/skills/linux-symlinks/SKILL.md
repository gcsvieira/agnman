# Skill: Linux Symlink Operations

## Context
Safe management of symbolic links for sharing resources between directories.

## Patterns

### Link Creation
Always use absolute paths for the target to ensure the link works regardless of the current working directory.
```bash
ln -s "$(realpath "$target")" "$link_path"
```

### Checking for Existing Links
- `-L`: Returns true if file exists and is a symbolic link.
- `-e`: Returns true if file exists.

```bash
if [[ -L "$path" ]]; then
    echo "Symlink already exists"
elif [[ -e "$path" ]]; then
    echo "Warning: Regular file/folder exists at $path"
fi
```

### Detecting Broken Links
```bash
if [[ -L "$path" && ! -e "$path" ]]; then
    echo "Link is broken"
fi
```

### Removing Links
Use `rm` (works for both file and directory symlinks without deleting the target content).
```bash
rm "$link_path"
```

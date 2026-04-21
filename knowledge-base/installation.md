---
id: installation
type: knowledge
tags: ["#installation", "#path"]
links: ["[[MOC-usage]]"]
---

# Installation & PATH Export

To use `agnman` from anywhere in your terminal, you should link the source script to a directory in your `$PATH`.

## Recommended Method: Symlink to `~/.local/bin`

1. **Create the symlink**:
   ```bash
   ln -s "$(realpath src/agnman)" ~/.local/bin/agnman
   ```

2. **Ensure `~/.local/bin` is in your PATH**:

### Bash / Zsh
Add this to your `~/.bashrc` or `~/.zshrc`:
```bash
export PATH="$HOME/.local/bin:$PATH"
```
Then reload: `source ~/.bashrc` (or `~/.zshrc`)

### Fish Shell
Run this command once in your terminal:
```fish
fish_add_path ~/.local/bin
```
Or add this to your `~/.config/fish/config.fish`:
```fish
set -px PATH ~/.local/bin
```

## Alternative: Local Alias (Quick & Dirty)
Add this to your shell config:
```bash
alias agnman='/home/glhrm/Coding/agnman/src/agnman'
```

## Why Symlink?
Linking to `~/.local/bin` allows you to update the tool by simply pulling new changes in the repository without having to reinstall or copy files again.

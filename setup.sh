#!/usr/bin/env bash

set -euo pipefail

# --- Configuration ---
AGNMAN_URL="https://raw.githubusercontent.com/gcsvieira/agnman/master/src/agnman"
BIN_DIR="$HOME/.local/bin"
DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/agnman"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}agnman setup starting...${NC}"

# 1. Create global database directories
echo -e "Creating database directories in $DATA_DIR..."
mkdir -p "$DATA_DIR/skills" "$DATA_DIR/rules"

# 2. Ensure ~/.local/bin exists
mkdir -p "$BIN_DIR"

# 3. Clean up old installation
if [[ -e "$BIN_DIR/agnman" || -L "$BIN_DIR/agnman" ]]; then
    rm -f "$BIN_DIR/agnman"
fi

# 4. Download or Symlink agnman
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ -f "$SCRIPT_DIR/src/agnman" ]]; then
    echo -e "Local repository detected at $SCRIPT_DIR. Symlinking..."
    INSTALL_PATH="$SCRIPT_DIR/src/agnman"
    ln -sf "$INSTALL_PATH" "$BIN_DIR/agnman"
    echo -e "${GREEN}Symlinked local version successfully.${NC}"
else
    echo -e "Downloading agnman to $BIN_DIR..."
    if ! curl -fsSL "$AGNMAN_URL" -o "$BIN_DIR/agnman"; then
        echo -e "${RED}Error: Failed to download agnman from GitHub.${NC}"
        exit 1
    fi
    chmod +x "$BIN_DIR/agnman"
fi

# 5. Check PATH configuration
echo -e "Checking PATH configuration..."
if [[ ":$PATH:" == *":$BIN_DIR:"* ]]; then
    echo -e "${GREEN}agnman is ready to use!${NC}"
else
    echo -e "${RED}Warning: $BIN_DIR is not in your PATH.${NC}"
    echo -e "Please add the following line to your shell configuration (.bashrc, .zshrc, or config.fish):"
    
    # Detect shell
    SHELL_NAME=$(basename "$SHELL")
    if [[ "$SHELL_NAME" == "fish" ]]; then
        echo -e "${BLUE}  fish_add_path $BIN_DIR${NC}"
    else
        echo -e "${BLUE}  export PATH=\"$BIN_DIR:\$PATH\"${NC}"
    fi
fi

echo -e "\n${GREEN}Setup complete! Try running 'agnman skill list' to verify.${NC}"

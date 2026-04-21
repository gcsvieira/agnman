#!/usr/bin/env bash

set -euo pipefail

# --- Configuration ---
REPO_URL="https://github.com/gcsvieira/agnman.git"
INSTALL_ROOT="$HOME/.agnman"
BIN_DIR="$HOME/.local/bin"
DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/agnman"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}agnman setup starting...${NC}"

# 1. Ensure we have the source code
if [[ ! -d "$INSTALL_ROOT" ]]; then
    echo -e "Cloning agnman to $INSTALL_ROOT..."
    git clone "$REPO_URL" "$INSTALL_ROOT"
    INSTALL_DIR="$INSTALL_ROOT"
else
    # If we are already inside a clone, use the current directory
    if [[ -f "./src/agnman" ]]; then
        INSTALL_DIR="$(pwd)"
        echo -e "Using local installation at $INSTALL_DIR"
    else
        echo -e "Updating agnman at $INSTALL_ROOT..."
        cd "$INSTALL_ROOT" && git pull
        INSTALL_DIR="$INSTALL_ROOT"
    fi
fi

# 2. Create global database directories
echo -e "Creating database directories in $DATA_DIR..."
mkdir -p "$DATA_DIR/skills" "$DATA_DIR/rules"

# 3. Ensure ~/.local/bin exists
mkdir -p "$BIN_DIR"

# 4. Create symlink
echo -e "Linking agnman to $BIN_DIR..."
if [[ -L "$BIN_DIR/agnman" ]]; then
    rm "$BIN_DIR/agnman"
fi
ln -s "$INSTALL_DIR/src/agnman" "$BIN_DIR/agnman"
chmod +x "$INSTALL_DIR/src/agnman"

# 5. Check PATH
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

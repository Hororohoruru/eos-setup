#!/bin/bash
set -e

echo "[*] Cloning dotfiles repository..."

USERNAME=$(git config --global user.name)
REPO="git@github.com:${USERNAME}/dotfiles.git"
CLONE_DIR="$HOME/dotfiles"

if [ -d "$CLONE_DIR" ]; then
  echo "[✓] Dotfiles directory already exists, skipping clone..."
else
  echo "[*] Cloning from $REPO..."
  git clone "$REPO" "$CLONE_DIR"
fi

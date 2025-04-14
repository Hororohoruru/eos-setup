#!/bin/bash
set -e

echo "[*] Stowing dotfiles..."
cd ~/dotfiles
stow .  # Adjust this line based on your folders
cd -

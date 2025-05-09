#!/bin/bash
set -e

echo "[*] Setting up SSH key for GitHub..."

if [ ! -f ~/.ssh/id_ed25519 ]; then
  ssh-keygen -t ed25519 -C "your_email@example.com"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519

  echo "[*] SSH public key:"
  cat ~/.ssh/id_ed25519.pub

  # Copy public key to clipboard using xclip
  cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard
  echo "[*] SSH public key copied to clipboard."
  echo "[!] Add this key to GitHub: https://github.com/settings/ssh/new"
else
  echo "[✓] SSH key already exists, skipping..."
fi

# Prompt for Git username and email
echo "[*] Setting up Git configuration..."
read -p "Enter your Git username: " git_username
read -p "Enter your Git email: " git_email

# Set Git config with the provided values
git config --global user.name "$git_username"
git config --global user.email "$git_email"

echo "[*] Git configuration set:"
git config --global user.name
git config --global user.email

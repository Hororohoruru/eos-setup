#!/bin/bash
set -e

echo "[*] Setting Zsh as the default shell..."

# Check if zsh is installed
if ! command -v zsh &>/dev/null; then
  echo "[*] Zsh not found. Installing..."
  sudo pacman -S --noconfirm zsh
else
  echo "[✓] Zsh is already installed."
fi

# Change the default shell to zsh for the current user
if [[ "$SHELL" != "$(which zsh)" ]]; then
  echo "[*] Changing default shell to zsh..."
  chsh -s "$(which zsh)"
  echo "[✓] Default shell changed to zsh."
else
  echo "[✓] Zsh is already the default shell."
fi

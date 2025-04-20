#!/bin/bash
set -e

echo "[*] Installing TPM (Tmux Plugin Manager)..."

TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ -d "$TPM_DIR" ]; then
  echo "[✓] TPM already installed at $TPM_DIR"
else
  echo "[*] Cloning TPM into $TPM_DIR..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
  echo "[✓] TPM installed."
fi

# Optional: Automatically install plugins (requires tmux to be running)
if command -v tmux &>/dev/null; then
  echo "[*] Attempting to install tmux plugins via TPM..."
  tmux start-server 
  tmux new-session -d 
  "$TPM_DIR/bin/install_plugins" 
  tmux kill-server 
  echo "[✓] Tmux plugins installed."
else
  echo "[!] tmux not found. Skipping plugin installation."
fi

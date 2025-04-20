#!/bin/bash
set -e

echo "[*] Installing micromamba..."

INSTALL_DIR="$HOME/micromamba"
MAMBA_BIN="$INSTALL_DIR/bin/micromamba"

if [ -f "$MAMBA_BIN" ]; then
  echo "[✓] micromamba already installed, skipping..."
else
  mkdir -p "$INSTALL_DIR"
  cd "$INSTALL_DIR"
  curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba

  echo 'export PATH="$HOME/micromamba/bin:$PATH"' >> ~/.bashrc
  echo "[*] micromamba installed. Restart your shell or source your .bashrc to use it."
fi

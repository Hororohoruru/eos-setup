#!/bin/bash
set -e 

PACKAGE_LIST="./package-list.txt"

echo "[*] Updating system..."
sudo pacman -Syu --noconfirm

echo "[*] Installing packages from $PACKAGE_LIST..."
while IFS= read -r pkg; do
  if yay -Q "$pkg" &> /dev/null; then
    echo "[✓] $pkg is already installed, skipping..."
  else
    echo "[+] Installing $pkg..."
    yay -S --noconfirm "$pkg"
  fi
done < "$PACKAGE_LIST"

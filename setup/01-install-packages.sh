#!/bin/bash
set -e 

PACKAGE_LIST="./package-list.txt"

echo "[*] Updating system..."
sudo pacman -Syu --noconfirm

echo "[*] Checking that yay is installed..."
if command -v yay >/dev/null 2>&1; then
  echo "Yay is already installed, good!"
else
  echo "Installing Yay..."
  sudo pacman -S --needed --noconfirm git base-devel  
  git clone "https://aur.archlinux.org/yay.git" "$HOME/gitrepos/yay"
  cd "$HOME/gitrepos/yay"
  makepkg -si
  cd -
fi

echo "[*] Installing packages from $PACKAGE_LIST..."
while IFS= read -r pkg; do
  if yay -Q "$pkg" &> /dev/null; then
    echo "[✓] $pkg is already installed, skipping..."
  else
    echo "[+] Installing $pkg..."
    yay -S --noconfirm "$pkg"
  fi
done < "$PACKAGE_LIST"

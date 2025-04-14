#!/bin/bash
set -e

echo "=============================="
echo "[*] POST-INSTALL SYSTEM SETUP"
echo "=============================="

echo "[*] Checking for NVIDIA GPU..."
if lspci | grep -i nvidia &>/dev/null; then
  echo "[*] NVIDIA GPU detected. Installing drivers..."
  nvidia-inst 
else
  echo "[!] No NVIDIA GPU found. Skipping NVIDIA driver installation."
fi

echo "[*] Ensuring multilib repository is enabled..."
if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
  sudo sed -i '/\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf
  echo "[*] Multilib enabled. Updating package database..."
  sudo pacman -Syu 
else
  echo "[✓] Multilib already enabled."
fi

echo "[*] Enabling and starting NetworkManager..."
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

TO_REMOVE=(xfce4 xfce4-goodies lightdm lightdm-gtk-greeter)
echo "[*] Removing XFCE and LightDM components (if installed)..."
for pkg in "${TO_REMOVE[@]}"; do
  if pacman -Q "$pkg" &> /dev/null; then
    echo "[−] Removing $pkg..."
    sudo pacman -Rsn --noconfirm "$pkg"
  else
    echo "[✓] $pkg not installed, skipping..."
  fi
done

echo "[✓] Post-install tasks complete!"

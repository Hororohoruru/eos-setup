# EndeavourOS Post-Install Setup

Automated setup scripts for quickly configuring a fresh EndeavourOS install.

## 🚀 Usage

```bash
chmod +x run-all.sh setup/*.sh
./run-all.sh
```

## 📦 package-list.txt

Add the names of packages (pacman or AUR) you'd like to install automatically.

## 💻 Dotfiles

Make sure your dotfiles are on GitHub under a repo named `dotfiles` (or edit the script to match).

Uses your local Git config to determine your GitHub username:

```bash
git config user.name
```

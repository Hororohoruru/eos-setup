#!/bin/bash
set -e

cd "$(dirname "$0")/setup"

./00-post-install.sh
./01-install-packages.sh
./02-setup-ssh.sh
./03-clone-dotfiles.sh
./04-stow-dotfiles.sh
./05-install-mamba.sh

# Now, disable 'exit on error'
set +e

# Continue running any other commands if needed, or for manual checks
echo "[*] All setup scripts completed."

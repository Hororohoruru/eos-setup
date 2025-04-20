#!/bin/zsh

# Function to check if a command is available
command_exists() {
    command -v "$1" &>/dev/null
}

# Step 1: Check if Miniforge is installed
if ! command_exists conda; then
    echo "[*] Miniforge not found. Installing Miniforge..."

    # Download Miniforge installer
    MINIFORGE_INSTALLER="$HOME/miniforge3.sh"
    wget -qO "$MINIFORGE_INSTALLER" https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh

    # Install Miniforge
    bash "$MINIFORGE_INSTALLER" -b -p "$HOME/miniforge"

    # Clean up installer
    rm -f "$MINIFORGE_INSTALLER"

    # Add Miniforge to the PATH for zsh
    echo "export PATH=\"$HOME/miniforge/bin:\$PATH\"" >> "$HOME/.zshrc"

    # Initialize conda for zsh
    "$HOME/miniforge/bin/conda" init zsh
    source "$HOME/.zshrc"

    echo "[✓] Miniforge installed and initialized."
else
    echo "[✓] Miniforge (conda) already installed."
fi

# Step 2: Check if mamba is installed
if ! command_exists mamba; then
    echo "[*] Installing mamba..."

    # Install mamba using conda from the conda-forge channel
    "$HOME/miniforge/bin/conda" install -c conda-forge mamba -y --quiet

    echo "[✓] Mamba installed."
else
    echo "[✓] Mamba already installed."
fi

# Step 3: Verify mamba installation
echo "[*] Verifying mamba installation..."
mamba --version

# Step 4: Optional cleanup
echo "[*] Cleaning up unused conda packages..."
"$HOME/miniforge/bin/conda" clean --all --yes

echo "[✓] Mamba installation complete."

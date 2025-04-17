#!/bin/bash

# Exit on error
set -e

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install Neovim
install_neovim() {
    echo "Installing Neovim..."
    
    # Try installing via AppImage first (fastest)
    if [ "$(uname)" = "Linux" ]; then
        echo "Installing Neovim via AppImage..."
        curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
        chmod u+x nvim.appimage
        sudo mv nvim.appimage /usr/local/bin/nvim
    else
        # For macOS, try installing via Homebrew with --HEAD flag (faster than stable)
        if command_exists brew; then
            echo "Installing Neovim via Homebrew (HEAD version)..."
            brew install --HEAD neovim
        else
            # If Homebrew is not available, try direct download
            echo "Installing Neovim via direct download..."
            curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-macos.tar.gz
            tar xzf nvim-macos.tar.gz
            sudo mv nvim-macos/bin/nvim /usr/local/bin/
            rm -rf nvim-macos nvim-macos.tar.gz
        fi
    fi
}

# Check and install prerequisites
echo "Checking prerequisites..."

# Check for Homebrew (macOS package manager)
if ! command_exists brew; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Vim if not installed
if ! command_exists vim; then
    echo "Installing Vim..."
    brew install vim
fi

# Install Neovim if not installed
if ! command_exists nvim; then
    install_neovim
fi

# Create necessary directories
echo "Creating configuration directories..."
mkdir -p ~/.config/nvim
mkdir -p ~/.vim

# Create symbolic links
echo "Setting up symbolic links..."
ln -sf ~/configs/.vimrc ~/.vimrc
ln -sf ~/configs/.vim ~/.vim
ln -sf ~/configs/.vimrc ~/.config/nvim/init.vim

# Install vim-plug if not already installed
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo "Installing vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install plugins
echo "Installing plugins..."
vim +PlugInstall +qall

echo "Setup complete! Your Vim/Neovim configuration is now linked to ~/configs" 
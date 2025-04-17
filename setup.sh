#!/bin/bash

# Exit on error
set -e

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
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
    echo "Installing Neovim..."
    brew install neovim
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
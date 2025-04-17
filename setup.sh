#!/bin/bash

# Exit on error
set -e

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install Neovim from tarball and copy full runtime
install_neovim() {
    echo "Installing Neovim from official tarball..."

    arch_name="$(uname -m)"
    if [ "$arch_name" = "arm64" ]; then
        url="https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz"
        folder="nvim-macos-arm64"
    else
        url="https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-x86_64.tar.gz"
        folder="nvim-macos-x86_64"
    fi

    curl -LO "$url"
    tar xzf "${url##*/}"

    sudo rm -rf /usr/local/bin/nvim /usr/local/share/nvim

    cd "$folder"
    sudo cp -r bin share /usr/local/
    cd ..
    rm -rf "$folder" "${url##*/}"
}

# Install Homebrew if missing
install_homebrew() {
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

# Install system dependencies
echo "Checking prerequisites..."

if ! command_exists brew; then
    install_homebrew
fi

if ! command_exists vim; then
    echo "Installing Vim..."
    brew install vim
fi

if ! command_exists nvim; then
    install_neovim
else
    echo "Neovim already installed: $(nvim --version | head -n1)"
fi

if ! command_exists node; then
    echo "Installing Node.js..."
    brew install node
fi

if ! command_exists yarn; then
    echo "Installing Yarn..."
    brew install yarn
fi

# Create required directories
mkdir -p ~/.config/nvim

# Setup config symlinks
echo "Setting up symbolic links..."

ln -sf ~/configs/.vimrc ~/.vimrc
ln -sf ~/configs/.vimrc ~/.config/nvim/init.vim

if [ -d ~/.vim ] && [ ! -L ~/.vim ]; then
    echo "Removing ~/.vim directory..."
    rm -rf ~/.vim
fi

ln -sf ~/configs/.vim ~/.vim

# Install vim-plug for Neovim
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
    echo "Installing vim-plug for Neovim..."
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install vim-plug for Vim
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo "Installing vim-plug for Vim..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install plugins
echo "Installing plugins..."
nvim +PlugInstall +qall || true

# Install Nerd Font for icons
echo "Installing JetBrainsMono Nerd Font for icon support..."
mkdir -p ~/Library/Fonts
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o JetBrainsMono.zip -d ~/Library/Fonts/
rm JetBrainsMono.zip

echo "✅ Setup complete! Launch Neovim with 'nvim'"
echo "🎨 Set your terminal font to 'JetBrainsMono Nerd Font' to see icons correctly."
echo "🪄 Tip: Add 'Plug 'ayu-theme/ayu-vim'' to plugins.vim if you're using the ayu theme."

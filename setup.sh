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

if ! command_exists nvm; then
    echo "Installing NVM (Node Version Manager)..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    # Source NVM in current shell
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    # Install latest LTS Node.js
    nvm install --lts
    nvm use --lts
    echo "Note: NVM installed with latest LTS Node.js"
elif ! command_exists node; then
    echo "Installing Node.js..."
    brew install node
fi

if ! command_exists yarn; then
    echo "Installing Yarn..."
    brew install yarn
fi

if ! command_exists gpg; then
    echo "Installing GPG..."
    brew install gnupg
fi

if ! command_exists fzf; then
    echo "Installing fzf..."
    brew install fzf
    # Install shell key bindings and fuzzy completion
    $(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc
fi

if ! command_exists ag; then
    echo "Installing the_silver_searcher (ag)..."
    brew install the_silver_searcher
fi

if ! command_exists rvm; then
    echo "Installing RVM (Ruby Version Manager)..."
    # Import RVM's GPG keys
    gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    # Install RVM without Ruby (to avoid compilation issues)
    curl -sSL https://get.rvm.io | bash -s stable
    # Source RVM in current shell
    source ~/.rvm/scripts/rvm
    echo "Note: RVM installed. You can install Ruby later with: rvm install ruby"
fi

if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Configure git global settings
echo "Setting up git global configuration..."
git config --global user.name "Brandon Jason"
git config --global user.email "bjvtamayo78@gmail.com"
git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.editor "nvim"

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

# Setup zshrc symlink
if [ -f ~/.zshrc ] && [ ! -L ~/.zshrc ]; then
    echo "Backing up existing ~/.zshrc to ~/.zshrc.backup..."
    mv ~/.zshrc ~/.zshrc.backup
fi

ln -sf ~/configs/.zshrc ~/.zshrc

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

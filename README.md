# Vim/Neovim Configuration

This repository contains my Vim and Neovim configuration files, optimized for Ruby development and general programming.

## Setup Instructions

1. Clone this repository to your home directory:
   ```bash
   git clone <repository-url> ~/configs
   ```

2. Make the setup script executable and run it:
   ```bash
   chmod +x ~/configs/setup.sh
   ~/configs/setup.sh
   ```

The setup script will:
- Create necessary directories
- Set up symbolic links for both Vim and Neovim
- Install vim-plug if not already installed
- Install all plugins

## Key Mappings

### Basic Navigation
- `Ctrl + k` - Scroll up
- `Ctrl + j` - Scroll down
- `Space + s` - EasyMotion search (type 2 characters to jump)
- `Space + h` - Previous tab
- `Space + l` - Next tab
- `Space + ob` - Open buffer list

### File Operations
- `Space + w` - Save file
- `Space + q` - Close file
- `Space + p` - Open file search (FZF)
- `Space + ag` - Search in files (Ag)
- `Space + nt` - Toggle NERDTree
- `Space + ;` - Add semicolon at end of line

### Git Operations
- `Space + G` - Open Git status
- `Space + gp` - Git push
- `Space + gl` - Git pull
- `Space + blame` - Show Git blame
- `Space + diff` - Show Git diff
- Use `-` to stage/unstage
- Use `cc` to commit

### Code Navigation
- `gd` - Go to definition
- `gy` - Go to type definition
- `gi` - Go to implementation
- `gr` - Show references

### Testing (RSpec)
- `Space + t` - Run nearest test
- `Space + T` - Run current file tests
- `Space + TT` - Run entire test suite

### Ruby Specific
- Automatic `end` insertion for blocks
- Rails project navigation
- Ruby refactoring tools
- Bundler integration

## Configuration Structure

- `.vimrc` - Main configuration file
- `.vim/` - Vim plugins and additional configuration
  - `plugins.vim` - Plugin definitions
  - `maps.vim` - Key mappings
  - `plugin-config.vim` - Plugin configurations
- `setup.sh` - Setup script for easy installation

## Features

- Vim and Neovim compatible
- Plugin management with vim-plug
- Symbolic links for easy updates
- Ruby and Rails development support
- Git integration
- File navigation with NERDTree and FZF
- Code completion with coc.nvim
- Syntax highlighting for multiple languages
- Automatic dark/light theme switching based on system preferences

## Tips

1. The leader key is set to `Space`
2. Most commands are prefixed with the leader key
3. Use `Space + p` to quickly find and open files
4. Use `Space + ag` to search through your codebase
5. Use `Space + nt` to toggle the file explorer
6. Use `Space + t` to run tests
7. Use `Space + G` to manage Git operations

# Vim/Neovim Configuration

This repository contains my Vim and Neovim configuration files, optimized for Ruby development and general programming.

## Project Structure

```
┌─────────────────────────────────────────────────────────────────┐
│                        ~/configs/                               │
│                                                                 │
│  ┌─────────────┐    ┌─────────────┐    ┌───────────────────┐   │
│  │   .vimrc    │    │  setup.sh   │    │    README.md      │   │
│  └─────┬───────┘    └──────┬──────┘    └───────────────────┘   │
│        │                   │                                    │
│        │                   │                                    │
│        ▼                   ▼                                    │
│  ┌─────────────┐    ┌──────────────────────────────────────┐   │
│  │   .vim/     │    │  Installation & Setup Process        │   │
│  └─────┬───────┘    │                                      │   │
│        │            │  1. Install Dependencies             │   │
│        ▼            │     - Vim                            │   │
│  ┌─────────────┐    │     - Neovim                        │   │
│  │ plugins.vim  │    │     - Node.js                       │   │
│  │             │    │     - Yarn                          │   │
│  │  ┌────────┐ │    │                                      │   │
│  │  │ coc.nvim│ │    │  2. Create Symbolic Links           │   │
│  │  │ vim-ruby│ │    │     ~/.vimrc → ~/configs/.vimrc    │   │
│  │  │ vim-rails││    │     ~/.vim → ~/configs/.vim        │   │
│  │  │ ...     │ │    │     ~/.config/nvim/init.vim → ...  │   │
│  │  └────────┘ │    │                                      │   │
│  └─────────────┘    │  3. Install vim-plug                 │   │
│        │            │                                      │   │
│        ▼            │  4. Install Plugins                  │   │
│  ┌─────────────┐    │                                      │   │
│  │ maps.vim    │    └──────────────────────────────────────┘   │
│  │             │                                               │
│  │  ┌────────┐ │                                               │
│  │  │ Space+w│ │                                               │
│  │  │ Space+q│ │                                               │
│  │  │ Space+t│ │                                               │
│  │  │ ...    │ │                                               │
│  │  └────────┘ │                                               │
│  └─────────────┘                                               │
│        │                                                       │
│        ▼                                                       │
│  ┌─────────────┐                                               │
│  │ plugin-config.vim                                           │
│  └─────────────┘                                               │
└─────────────────────────────────────────────────────────────────┘

Key Features:
├── Language Support
│   ├── Ruby/Rails
│   ├── Syntax Highlighting
│   └── Code Completion
│
├── Navigation & Productivity
│   ├── NERDTree
│   ├── FZF
│   ├── Multiple Cursors
│   └── EasyMotion
│
├── Git Integration
│   ├── Status/Blame/Diff
│   ├── Push/Pull
│   └── Git Gutter
│
├── Testing
│   └── RSpec Integration
│
└── UI/UX
    ├── Theme Switching
    ├── Status Line
    └── Nerd Fonts

Symbolic Links:
┌─────────────────────────┐
│ ~/.vimrc               │
│ └──→ ~/configs/.vimrc  │
│                        │
│ ~/.vim                 │
│ └──→ ~/configs/.vim    │
│                        │
│ ~/.config/nvim/init.vim│
│ └──→ ~/configs/.vimrc  │
└─────────────────────────┘
```

## Setup Instructions

1. Clone this repository to your home directory:
   ```bash
   git clone https://github.com/bjvta/configs ~/configs
   ```

2. Make the setup script executable and run it:
   ```bash
   chmod +x ~/configs/setup.sh
   ~/configs/setup.sh
   ```

The setup script will:
- Install required dependencies (Homebrew, Vim, Neovim, NVM/Node.js, Yarn, GPG, fzf, RVM, Oh My Zsh)
- Configure git global settings
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




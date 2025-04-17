# Vim/Neovim Configuration Structure

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

## Legend

- `→` : Symbolic link
- `├──` : Feature category
- `└──` : Last item in category
- `│` : Vertical connection
- `─` : Horizontal connection
- `┌─┐` : Box/container
- `└─┘` : Box/container end

This diagram shows:
1. The directory structure of the configuration
2. The relationship between files
3. The installation process
4. Key features and their organization
5. Symbolic link structure 
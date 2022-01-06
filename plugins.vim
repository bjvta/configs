call plug#begin('~/.vim/plugged')

" syntax
Plug 'sheerun/vim-polyglot'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'yuezk/vim-js'
" Plug 'flowtype/vim-flow'

" Language
Plug 'tweekmonster/django-plus.vim'

" status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" Themes
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'wakatime/vim-wakatime'
Plug 'phanviet/vim-monokai-pro'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'overcache/NeoSolarized'
Plug 'shaunsingh/solarized.nvim'
"""Plug 'L-TChen/auto-dark-mode.vim'

" Tree
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'

Plug 'nathanaelkane/vim-indent-guides'

"" Plug 'othree/yajs.vim'



"" Plug 'aca/completion-tabnine', { 'do': './install.sh' }




"" Plug 'wfxr/minimap.vim'
"" Plug 'severin-lemaignan/vim-minimap'
" tmux
" Plug 'benmills/vimux'
" Plug 'christoomey/vim-tmux-navigator'
" autocomplete
" Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" test
"" Plug 'tyewang/vimux-jest-test'
"" Plug 'janko-m/vim-test'

" IDE
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdcommenter'
Plug 'davidhalter/jedi-vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-repeat'

call plug#end()

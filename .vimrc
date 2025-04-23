set number
set mouse=a
set numberwidth=1
set smartindent
set clipboard=unnamedplus
syntax on
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=2
set relativenumber

set re=1
set nowrap
set noswapfile
set incsearch
set scrolloff=8
set guicursor=

" === Load vim-plug for Neovim ===
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
runtime autoload/plug.vim

"" set termguicolors
so ~/.vim/plugins.vim
so ~/.vim/plugin-config.vim
so ~/.vim/maps.vim

vmap <C-p> y'>p
"" colorscheme gruvbox
"" set bg=light
"" colorscheme monokai
"" colorscheme monokai_pro
"" let g:gruvbox_contrast_dark = "hard"
"" let g:gruvbox_contrast_light = "soft"
"" highlight Normal ctermbg=NONE


"" set t_Co=256
"" colorscheme onehalfdark
"" colorscheme onehalflight
"" let g:airline_theme='onehalfdark'

set termguicolors

"" colorscheme PaperColor
"" dark mode enabled?
if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
  let ayucolor="dark"   " for dark version of theme
  try
    colorscheme monokai_pro
  catch /^Vim\%((\a\+)\)\=:E185/
    echom "Warning: ayu theme not found. Using default."
    "" colorscheme default
    colorscheme monokai
  endtry
  "" colorscheme monokai_pro
	"" colorscheme onehalfdark
  "" set background=dark
else
  "" colorscheme NeoSolarized
  "" colorscheme solarized
	colorscheme onehalflight
  set background=light
  let g:solarized_italic_comments = v:true
  let g:solarized_italic_keywords = v:true
  let g:solarized_italic_functions = v:true
  let g:solarized_italic_variables = v:false
  let g:solarized_contrast = v:true
  let g:solarized_borders = v:false
  let g:solarized_disable_background = v:false
endif



set laststatus=2
set noshowmode

"" BufNewFile,BufRead *.html set filetype=htmldjango

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set rtp+=/opt/homebrew/opt/fzf

" CoC configuration
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

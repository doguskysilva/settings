"   Personal settings to Neovim

set nocompatible 	        "disable comp with old vi
set showmatch		        "show matching
set ignorecase		        "case insensitive
set mouse=v                 "middle-click past
set hlsearch		        "search highlight
set tabstop=4		        "number space by a tab
set softtabstop=4	        "multiple spaces as tabstops
set expandtab		        "tabs like white space
set shiftwidth=4            "width for autoindents
set autoindent              "indent a new line the same amount
set number                  "show line of number
set wildmode=longest,list   "get bash like tab completetions
set cc=80                   "set 80 column border
filetype plugin indent on   "allow auto indent
syntax on                   "syntaxt highlihting
set mouse=a                 "enable mouse
set clipboard=unnamedplus   "use system clipboard
set cursorline              "highlight current line to cursos
set ttyfast                 "speed up scrolling in Vim
set backupdir=~/.cache/vim

"   Plugins
call plug#begin()
 Plug 'preservim/nerdtree'
 Plug 'dracula/vim'
call plug#end()

"   Plugins settings
""  colors schemes
if (has("termguicolors"))
    set termguicolors
endif
syntax enable
colorscheme dracula

"   Keymaps
""  Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>
""  Press n to toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

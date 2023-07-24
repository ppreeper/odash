" ----------
"  basic config
" ----------

filetype plugin indent on

" UI Configuration
syntax on
syntax enable
set updatetime=300
set shortmess+=c

" colorscheme
colorscheme codedark

" True Color Support if it's avaiable in terminal
if has("termguicolors")
    set termguicolors
endif

if has("gui_running")
    set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif
set cursorline

set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw

" turn off backup
set nobackup
set noswapfile
set nowritebackup

" search config
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic

" tab indent
set expandtab
set shiftwidth=4
set tabstop=4

" file backups and undo
set path+=**
set encoding=utf-8 nobomb
set ffs=unix,dos,mac

" autoload file
set autoread


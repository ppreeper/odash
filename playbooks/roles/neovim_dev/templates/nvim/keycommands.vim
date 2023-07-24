" ----------
" keymaps
" ----------
"  leader
let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<CR>
nmap <leader>q :q<CR>

" backspace
set backspace=eol,start,indent

" text spelling <leader>ss toggles spellcheck
map <leader>ss :setlocal spell!<CR>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" split screen
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" NERDtree
map <C-n> :NERDTreeToggle<CR>

" NERDCommenter
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle<cr>

" ----------
" commands
" ----------

autocmd FileType xml setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType yml setlocal shiftwidth=2 tabstop=2

let g:python3_host_prog='/usr/bin/python3'

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


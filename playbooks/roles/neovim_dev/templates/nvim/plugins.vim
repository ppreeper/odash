if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd!
    autocmd VimEnter * PlugInstall
endif

" ----------
" plugins
" ----------
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tomasiser/vim-code-dark'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
"Plug 'mechatroner/rainbow_csv'
"Plug 'norcalli/nvim-colorizer.lua'
Plug 'preservim/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim',{'branch': 'release'}
call plug#end()


local install_path = vim.fn.stdpath("data") .. "/site/autoload/plug.vim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd(
    [[
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd!
    autocmd VimEnter * PlugInstall
    ]]
  )
end

vim.cmd("call plug#begin('~/.local/share/nvim/plugged')")
-- theme
vim.cmd("Plug 'tomasiser/vim-code-dark'")
-- language support
vim.cmd("Plug 'sheerun/vim-polyglot'")
-- language servers
vim.cmd("Plug 'neovim/nvim-lspconfig'") -- native lsp connection
vim.cmd("Plug 'kabouzeid/nvim-lspinstall'")
vim.cmd("Plug 'nvim-treesitter/nvim-treesitter'") -- lexical code highlighting
vim.cmd("Plug 'hrsh7th/nvim-compe'") -- autocomplete
-- vim.cmd("Plug 'glepnir/lspsaga.nvim'")
vim.cmd("Plug 'mhartington/formatter.nvim'")
-- vim.cmd("Plug 'kosayoda/nvim-lightbulb'") -- add lightbulb for code actions
-- utilities
vim.cmd("Plug 'preservim/nerdtree'")
vim.cmd("Plug 'ap/vim-css-color'") -- highlights colour values
-- telescope
vim.cmd("Plug 'nvim-lua/popup.nvim'")
vim.cmd("Plug 'nvim-lua/plenary.nvim'")
vim.cmd("Plug 'nvim-telescope/telescope.nvim'")
-- snippets
-- vim.cmd("Plug 'sirver/ultisnips'") -- the engine
-- vim.cmd("Plug 'honza/vim-snippets'") -- the coal (the actual snippets)
-- vim.cmd("Plug 'norcalli/snippets.nvim'")
vim.cmd("Plug 'hrsh7th/vim-vsnip'")
vim.cmd("Plug 'hrsh7th/vim-vsnip-integ'")
-- tpope plugins
vim.cmd("Plug 'tpope/vim-commentary'") -- comment and uncomment things with ease
-- vim.cmd("Plug 'tpope/vim-endwise'") -- add end to languages that use end
-- vim.cmd("Plug 'tpope/vim-repeat'") --  repeat plugin commands
-- vim.cmd("Plug 'tpope/vim-surround'") -- surround texobjs with all kinds of delimiters
-- vim.cmd("Plug 'tpope/vim-vinegar'") -- netrw was in dired need for an upgrade
-- git
vim.cmd("Plug 'airblade/vim-gitgutter'") -- get your mind out of the sidebar
-- other stuff
vim.cmd("Plug 'ryanoasis/vim-devicons'")
vim.cmd("call plug#end()")

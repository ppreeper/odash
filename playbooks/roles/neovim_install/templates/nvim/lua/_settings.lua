local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd

cmd("filetype plugin indent on")
cmd("syntax on") -- syntax on
cmd("syntax enable")
cmd("colorscheme codedark") -- colorscheme
-- cmd("colorscheme slate")
cmd("set backspace=eol,start,indent")

-- global options
o.autoread = true
o.background = "dark"
o.backup = false
o.compatible = false
o.encoding = "UTF-8"
o.ffs = "unix,dos,mac"
o.guifont = "FiraCode_NF"
o.hlsearch = true
o.ignorecase = true
o.incsearch = true
o.lazyredraw = true
o.mouse = "a"
vim.cmd("set path+=**")
o.showcmd = true
o.showmatch = true
o.smartcase = true
o.splitbelow = true
o.splitright = true
o.timeoutlen = 2500
o.ttimeoutlen = 100
o.termguicolors = true
o.wildmode = "longest,list"

-- window local options
wo.cursorline = false
wo.number = true
wo.wrap = false

-- buffer local options
bo.autoindent = true
bo.expandtab = true
bo.shiftwidth = 4
bo.smartindent = true
bo.swapfile = false
bo.tabstop = 4
bo.undofile = true

vim.cmd [[
if exists('+pumblend')
    set pumblend=10     " pseudo-transparency for popup-menu
end
]]

vim.cmd [[
if exists('+winblend')
    set winblend=10     " pseudo-transparency for floating windows
end
]]

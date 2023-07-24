-- prevent type when pressing wq or q
vim.cmd [[
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
]]

-- load plugin manager first
require "plugins"

-- basic settings
require "_utils"
require "_settings"
require "_statusline"
require "_keycommands"

-- plugins config
require "_autoformat"
require "_treesitter"
require "_lspconfig"
require "_complete"

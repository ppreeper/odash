------------
-- Status-Line
------------
local mode_map = {
['n'] = 'normal ',
['no'] = 'n·operator pending ',
['v'] = 'visual ',
['V'] = 'v·line ',
[''] = 'v·block ',
['s'] = 'select ',
['S'] = 's·line ',
[''] = 's·block ',
['i'] = 'insert ',
['R'] = 'replace ',
['Rv'] = 'v·replace ',
['c'] = 'command ',
['cv'] = 'vim ex ',
['ce'] = 'ex ',
['r'] = 'prompt ',
['rm'] = 'more ',
['r?'] = 'confirm ',
['!'] = 'shell ',
['t'] = 'terminal '
}

local function mode()
    local m = vim.api.nvim_get_mode().mode
    if mode_map[m] == nil then return m end
    return mode_map[m]
end

vim.o.statusline = ""
                .. "%#PmenuSel#"
                .. mode()
                .. "%#StatusLine#"
                .. " %F"
                .. " %r"
                .. " %m"
                .. "%="
                .. "%#FoldColumn#"
                .. " %y"
                .. "%#StatusLine#"
                .. " %p%%"
                .. " %l/%L"
                .. " cl:%c"


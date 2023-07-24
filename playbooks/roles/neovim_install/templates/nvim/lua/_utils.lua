local utils = {}

function utils.map(type, key, value, opts)
  local options = opts or {}
  vim.api.nvim_set_keymap(type, key, value, options)
end

function utils.noremap(type, key, value, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(type, key, value, options)
end

function utils.create_augroup(autocmds, name)
  vim.cmd("augroup " .. name)
  vim.cmd("autocmd!")
  for _, autocmd in ipairs(autocmds) do
    vim.cmd("autocmd " .. table.concat(autocmd, " "))
  end
  vim.cmd("augroup END")
end

return utils

require "nvim-treesitter.configs".setup {
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "go",
    "gomod",
    "html",
    "javascript",
    "json",
    "lua",
    "php",
    "python",
    "regex",
    "rust",
    "scss",
    "svelte",
    "typescript",
    "yaml"
  },
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {"c"}
  },
  incremental_selection = {
    enable = true
  },
  indent = {
    enable = true
  }
}


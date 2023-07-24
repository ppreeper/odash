vim.cmd("autocmd FileType xml setlocal shiftwidth=2 tabstop=2")
vim.cmd("autocmd FileType yaml setlocal shiftwidth=2 tabstop=2")
vim.cmd("autocmd FileType yml setlocal shiftwidth=2 tabstop=2")
vim.cmd("autocmd FileType lua setlocal shiftwidth=2 tabstop=2")
vim.cmd("autocmd FileType python setlocal shiftwidth=4 tabstop=4")

local u = require "_utils"

u.create_augroup(
  {
    {
      "BufWritePre",
      "*",
      "FormatWrite"
    }
  },
  "FormatAutogroup"
)

require "formatter".setup(
  {
    logging = false,
    filetype = {
      ["*"] = {
        function()
          return {
            exe = "sed",
            args = {"-i", "'s/[ \t]*$//'"},
            stdin = true
          }
        end
      },
      lua = {
        function()
          return {
            exe = "luafmt",
            args = {"-l", "120", "-i", "2", "--stdin"},
            stdin = true
          }
        end
      },
      go = {
        function()
          return {
            exe = "goimports",
            args = {"-w"},
            stdin = false
          }
        end
      },
      json = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"-c", "-w"},
            stdin = false
          }
        end
      },
      javascript = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"-w"},
            stdin = false
          }
        end,
        -- eslint
        function()
          return {
            exe = "eslint",
            args = {"--fix"},
            stdin = false
          }
        end
      },
      typescript = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"-c", "-w"},
            stdin = false
          }
        end,
        -- eslint
        function()
          return {
            exe = "eslint",
            args = {"-fix", "--ext", ".ts"},
            stdin = false
          }
        end
      },
      python = {
        function()
          return {
            exe = "isort",
            args = {},
            stdin = false
          }
        end,
        function()
          return {
            exe = "yapf",
            args = {"-i"},
            stdin = false
          }
        end
      },
      html = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"-c", "-w"},
            stdin = false
          }
        end
      },
      xml = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"-c", "-w", "--tab-width", 2, "--xml-whitespace-sensitivity", "ignore"},
            stdin = false
          }
        end
      }
    }
  }
)

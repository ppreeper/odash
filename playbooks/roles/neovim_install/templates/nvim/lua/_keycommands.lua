local utils = require("_utils")
-----------
-- keymaps
-----------
--  leader
vim.g.mapleader = ","

utils.noremap("n", "<F3>", ":w<cr>", {silent = true})
utils.noremap("n", "<leader>w", ":w<cr>", {silent = true}) -- fast buffer save
utils.noremap("n", "<leader>q", ":q!<cr>", {silent = true}) -- quit quit quit

-- text spelling <leader>ss toggles spellcheck
utils.noremap("n", "<leader>ss", ":setlocal spell!<cr>", {})
utils.noremap("n", "<leader>sn", "]s", {})
utils.noremap("n", "<leader>sp", "[s", {})
utils.noremap("n", "<leader>sa", "zg", {})
utils.noremap("n", "<leader>s?", "z=", {})

-- split screen
utils.noremap("n", "<C-J>", "<C-W><C-J>", {})
utils.noremap("n", "<C-K>", "<C-W><C-K>", {})
utils.noremap("n", "<C-L>", "<C-W><C-L>", {})
utils.noremap("n", "<C-H>", "<C-W><C-H>", {})
utils.noremap("n", "<leader>o", ":split :enew<cr>", {}) -- new window right
utils.noremap("n", "<leader>e", ":vsplit :enew<cr>", {}) -- new window below

-- NERDtree
utils.noremap("n", "<c-n>", ":NERDTreeToggle<cr>", {}) -- NERDTree Toggle

utils.map("n", "<C-_>", "gcc", {}) -- comment
utils.map("v", "<C-_>", "gc", {}) -- comment

-- brackets
utils.noremap("i", "(", "()<left>", {})
utils.noremap("i", "()", "()", {})
utils.noremap("i", "[", "[]<left>", {})
utils.noremap("i", "[]", "[]", {})
utils.noremap("i", "{", "{}<left>", {})
utils.noremap("i", "{}", "{}", {})
utils.noremap("i", "{<CR>", "{<CR>}<ESC>O", {})
utils.noremap("i", "{;<CR>", "{<CR>};<ESC>O", {})
utils.noremap("i", '"', '""<left>', {})
utils.noremap("i", "'", "''<left>", {})
utils.noremap("i", "<", "<><left>", {})
utils.noremap("i", "<<space>", "<<space>", {})
utils.noremap("i", "<=", "<=<space>", {})
utils.noremap("v", '"', 'c""<esc>P', {})
utils.noremap("v", "'", "c''<esc>P", {})
utils.noremap("v", "(", "c()<esc>P", {})
utils.noremap("v", "[", "c[]<esc>P", {})
utils.noremap("v", "{", "c{}<esc>P", {})
-- imap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
-- imap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
-- imap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
-- imap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
-- imap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
-- utils.map("i", "<expr> )", "strpart(getline('.'), col('.')-1, 1) == ')' ? '<Right>' : ')'", {})

-- Highlight on yank
utils.create_augroup(
  {
    {
      "TextYankPost",
      "*",
      "silent! lua vim.highlight.on_yank()"
    }
  },
  "YankHighlight"
)

-- Y yank until the end of line
utils.noremap("n", "Y", "y$", {})

-- telescope
utils.noremap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", {})
utils.noremap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", {})
utils.noremap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", {})
utils.noremap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", {})

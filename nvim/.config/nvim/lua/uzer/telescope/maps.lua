local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent=true}

map('n', '<leader>ff', '<cmd>Telescope find_files hidden=true no_ignore=true<cr>',  opts)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>',     opts)
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>',       opts)
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>',     opts)

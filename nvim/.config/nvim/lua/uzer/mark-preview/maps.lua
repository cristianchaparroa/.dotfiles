local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent=true}

map('n',    '<leader>mp', '<cmd>MarkdownPreview<cr>',          opts)
map('n',    '<leader>ms', '<cmd>MarkdownPreviewStop<cr>',      opts)
map('n',    '<leader>mt', '<cmd>MarkdownPreviewToggle<cr>',    opts)

local map = vim.api.nvim_set_keymap

map('n', '<leader>ty', ':TablineBufferNext<CR>', { noremap = true })
map('n', '<leader>tr', ':TablineBufferPrevious<CR>', { noremap = true })

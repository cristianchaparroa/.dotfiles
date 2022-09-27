-- set leader to space
vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap
local noremap = {noremap = true}

-- Reference: https://www.linuxfordevices.com/tutorials/linux/copy-paste-multiple-registers-in-vim

-- Set a key-mapping for copy and pasting to the system clipboard

map('v', '<leader>y', '"+y', noremap)
map('n', '<leader>p', '"+p', noremap)


-- Set key-mapping for dealing with two alphabetical registers easily
-- Two does the work for me, you can set more
--
map('v', '<leader>a', '"ay', noremap)
map('v', '<leader>A', '"Ay', noremap)
map('n', '<leader>a', '"api', noremap)

map('v', '<leader>x', '"xy', noremap)
map('v', '<leader>X', '"Xy', noremap)
map('n', '<leader>x', '"xpcall', noremap)



local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent=true}
local silent = {silent = true}


map("n", "sf",  "<cmd>Lspsaga lsp_finder<CR>",  opts)                       -- finder
map("n", "sh",  "<cmd>Lspsaga hover_doc<CR>",   opts)                       -- hover doc
map("n", "sr",  "<cmd>Lspsaga rename<CR>",      silent)                     -- rename

map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>",    silent)           -- Code action
map("n", "<A-d>",  "<cmd>Lspsaga open_floaterm<CR>", silent)                -- Float terminal
map("t", "<A-d>", "[[<C-\\><C-n><cmd>Lspsaga close_floaterm<CR>]]", silent) -- close float term

map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>",    silent) -- Show line diagnostics
map("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>",  silent) -- Show cursor diagnostic


map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", silent)             -- Diagnostic jump can use `<c-o>` to jump back
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", silent)



local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent=true}

map("n", "gh",      "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>",                  opts)
map("n", "K",       "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>",             opts)   -- sgiw giver doc
map("n", "<C-f>",   "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",     opts)   -- scroll down hover doc or scroll in definition preview
map("n", "<C-b>",   "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",    opts)   -- scroll up hover doc
map("n", "<leader>s",      "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>",       opts)   -- show signature help
map("n", "mm",      "<cmd>lua require('lspsaga.rename').rename()<CR>", {noremap = true})            -- rename

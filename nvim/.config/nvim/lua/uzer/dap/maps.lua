local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent=true}

map('n',    '<leader>dc',   '<Cmd>lua require("dap").continue()<CR>',       opts)
map('n',    '<leader>do',   '<Cmd>lua require("dap").step_over()<CR>',      opts)
map('n',    '<leader>di',   '<Cmd>lua require("dap").step_into()<CR>',      opts)
map('n',    '<leader>de',   '<Cmd>lua require("dap").step_out()<CR>',       opts)
map('n',    '<leader>dr',   '<Cmd>lua require("dap").repl.open()<CR>',      opts)
map('n',    '<leader>dl',   '<Cmd>lua require("dap").run_last()<CR>',       opts)

map('n',    '<leader>dt',   '<Cmd>lua require("dap").toggle_breakpoint()<CR>', opts)
map('n',    '<leader>B',    '<Cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
map('n',    '<leader>lp',   '<Cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opts)
map('v',    '<M-k>',        '<Cmd>lua require("dapui").eval()<CR>',         opts ) --  <M-k> is ALT-k

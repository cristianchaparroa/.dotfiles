
-- Set updatetime for CursorHold
-- 300ms of no cursor movement to trigger CursorHold
--
-- autocmd CursorHold: Show diagnostic popup on cursor hold
-- autocmd BufWritePre:  "format-on-write" (with a timeout of 200ms)
vim.cmd[[
    set updatetime=300
    autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]]    
    -- :autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)

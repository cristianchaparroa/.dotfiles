
local map = vim.api.nvim_set_keymap

function check_back_space()
    -- get row and column
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  
    -- get current line of text
    local linetext = vim.api.nvim_get_current_line()

    return col == 0 or string.match(linetext:sub(col, col), '%s') ~= nil
end

local EXPR_NOREF_NOERR_TRUNC = { expr = true, noremap = true, silent = true, nowait = true }

-- Use tab for trigger completion with characters ahead and navigate.
-- Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
map('i', '<silecnt><expr><TAB>', 'check_back_space() ? "<C-n>": "<TAB>"', EXPR_NOREF_NOERR_TRUNC)
map('i', '<expr><S-TAB>', 'pumvisible() ? "<C-p>" : "<C-h>"', EXPR_NOREF_NOERR_TRUNC)



-- Use <c-space> (Ctrl + space bar ) to trigger completion.
map('i', '<silent><expr> <C-space?', 'coc#refresh()', EXPR_NOREF_NOERR_TRUNC)

-- use `[c` and `]c` to navigate diagnostics
map('n', '<silent> [c', '<Plug>(coc-diagnostics-prev)', EXPR_NOREF_NOERR_TRUNC)
map('n', '<silent> ]c', '<Plug>(coc-diagnostics-next)', EXPR_NOREF_NOERR_TRUNC)

-- Remap keys for gotos
map('n', '<silent> gd', '<Plug>(coc-definition)', EXPR_NOREF_NOERR_TRUNC)
map('n', '<silent> gy', '<Plug>(coc-type-definition)', EXPR_NOREF_NOERR_TRUNC)

-- it doesn't works why? 
map('n', '<silent> gi', '<Plug>(coc-implementation)', EXPR_NOREF_NOERR_TRUNC)
map('n', '<silent> gr', '<Plug>(coc-references)', EXPR_NOREF_NOERR_TRUNC)


-- remap for rename current word
map('n', '<leader>rn', '<Plug>(coc-rename)', EXPR_NOREF_NOERR_TRUNC)

-- remap for format selected region 
-- map('v', '<leader>f', '<Plug>(coc-format-selected)', EXPR_NOREF_NOERR_TRUNC)



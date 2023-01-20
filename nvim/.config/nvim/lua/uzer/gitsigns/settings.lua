require('gitsigns').setup {
	-- signs config
    signs = {
        add          = {hl = 'DiffAdd'   , text = '│', show_count=true},
        change       = {hl = 'DiffChange', text = '│', show_count=true},
        delete       = {hl = 'DiffDelete', text = '_', show_count=true},
        topdelete    = {hl = 'DiffDelete', text = '‾', show_count=true},
        changedelete = {hl = 'DiffChange', text = '~', show_count=true},
    },
    count_chars = {
        [1]   = '1', -- '₁',
        [2]   = '2', -- '₂',
        [3]   = '3', -- '₃',
        [4]   = '4', -- '₄',
        [5]   = '5', -- '₅',
        [6]   = '6', -- '₆',
        [7]   = '7', -- '₇',
        [8]   = '8', -- '₈',
        [9]   = '9', -- '₉',
        ['+'] = '' , -- '₊',
    },
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text_pos = 'right_align'
	},
}

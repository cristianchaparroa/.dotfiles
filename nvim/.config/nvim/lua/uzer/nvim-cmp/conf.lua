local cmp = require('cmp')

-- Setup Completion
-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        -- You must install `vim-vsnip` if you use the following as-is.
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>']       = cmp.mapping.select_prev_item(),
    ['<C-n>']       = cmp.mapping.select_next_item(),
    
    -- Add tab support
    ['<S-Tab>']     = cmp.mapping.select_prev_item(),
    ['<Tab>']       = cmp.mapping.select_next_item(),
    ['<C-d>']       = cmp.mapping.scroll_docs(-4),
    ['<C-f>']       = cmp.mapping.scroll_docs(4),
    ['<C-Space>']   = cmp.mapping.complete(),
    ['<C-e>']       = cmp.mapping.close(),
    ['<CR>']        = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})


--[[
cmp.setup {
	-- Format the autocomplete menu
	formatting = {
		format = lspkind.cmp_format()
	},
	mapping = {
        -- Use Tab and shift-Tab to navigate autocomplete menu
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
        end,
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}
]]

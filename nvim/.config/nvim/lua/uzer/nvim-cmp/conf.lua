local cmp = require('cmp')

-- Setup Completion
-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
cmp.setup({
  
  window = {
    documentation = {
      border = 'rounded',
      scrollbar = '',
      -- scrollbar = false,
    },
    completion = {
      border = 'rounded',
      scrollbar = '',
      -- scrollbar = false,
    },
  },
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        -- You must install `vim-vsnip` if you use the following as-is.
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>']       = cmp.mapping.select_prev_item(),
    ['<C-o>']       = cmp.mapping.select_next_item(),
    
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

  sorting = {
    comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.recently_used,
        require("clangd_extensions.cmp_scores"),
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
    }
  },

})

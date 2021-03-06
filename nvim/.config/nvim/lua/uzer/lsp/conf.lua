-- lspconfig
local nvim_lsp = require('lspconfig')
local signature = require('lsp_signature')

local servers = { 
    'gopls', 
    'sumneko_lua',
    'pylsp',
    'tsserver'
}

local on_attach = function(client, bufnr)
    local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

      -- remaps 
    map('n', '<gg',     '<cmd>lua vim.lsp.buf.declaration()<CR>',       opts)
    map('n', 'K',       '<cmd>lua vim.lsp.buf.hover()<CR>',             opts)
    map('n', 'gi',      '<cmd>lua vim.lsp.buf.implementation()<CR>',    opts)
    map('n', '<c-k>',   '<cmd>lua vim.lsp.buf.signature_help()<CR>',    opts)
    map('n', 'gt',      '<cmd>lua vim.lsp.buf.type_definition()<CR>',   opts)
    map('n', 'gr',      '<cmd>lua vim.lsp.buf.references()<CR>',        opts)
    map('n', 'g0',      '<cmd>lua vim.lsp.buf.document_symbol()<CR>',   opts)
    map('n', 'gd',      '<cmd>lua vim.lsp.buf.definition()<CR>',        opts)
    map('n', 'ga',      '<cmd>lua vim.lsp.buf.code_action()<CR>',       opts)
    map('n', 'ga',      '<cmd>lua vim.lsp.buf.code_action()<CR>',       opts)
    map('n', 'gW',      '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>',  opts)
    map('n', 'g[',      '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',  opts)
    map('n', 'g]',      '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',  opts)

    map('n', '<leader>wa',  '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',      opts)
    map('n', '<leader>wr',  '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',   opts)
    map('n', '<leader>rn',  '<cmd>lua vim.lsp.buf.rename()<CR>',                    opts)
    map('n', '<leader>ca',  '<cmd>lua vim.lsp.buf.code_action()<CR>',               opts)
    map('n', '<leader>q',   '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',        opts)
    map('n', '<leader>f',   '<cmd>lua vim.lsp.buf.formatting()<CR>',                opts)

    map('n', '<leader>e',   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',  opts)
    map('n', '<leader>wl',  '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

    -- signature integration
    signature.on_attach({
        bind = true,                -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
            border = "rounded"
        },
        toggle_key = '<leader>x',   -- close the floating window
        floating_window = false,    -- show hint in a floating window, set to false for virtual text only mode

    }, bufnr)

    map('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts) -- open  manually  the floating window on signature
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- rust configuration
require('rust-tools').setup({ server = { on_attach = on_attach, } })

--  type script configuration
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.formatting.prettier
    },
    on_attach = on_attach
})

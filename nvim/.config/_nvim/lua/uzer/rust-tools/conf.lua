local nvim_lsp = require("lspconfig")

local opts = {

    -- rust-tools options
    tools = { 
        -- Automatically set inlay hints (type hints)
        autoSetHints = true,
        
        -- Whether to show hover actions inside the hover window
        -- This overrides the default hover handler
        hover_with_actions = true,
        
        inlay_hints = { 
            -- wheter to show parameter hints with the inlay hints or not
            show_parameter_hints = false,

            -- prefix for parameter hints
            parameter_hints_prefix = "",

            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = "",
        },
    },

    hover_actions = {
        -- the border that is used for the hover window
        -- see vim.api.nvim_open_win()
        border = {
            {"╭", "FloatBorder"}, {"─", "FloatBorder"},
            {"╮", "FloatBorder"}, {"│", "FloatBorder"},
            {"╯", "FloatBorder"}, {"─", "FloatBorder"},
            {"╰", "FloatBorder"}, {"│", "FloatBorder"}
        },

        -- whether the hover action window gets automatically focused
        auto_focus = false
    },
    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
    -- debugging    
    dap = {
        adapter = {
            type = 'executable',
            command = 'lldb-vscode',
            name = "rt_lldb"
        }
    }
}

require('rust-tools').setup(opts)
vim.lsp.set_log_level("error")



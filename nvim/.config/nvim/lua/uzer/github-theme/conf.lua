local groups = {
    all =  {
        
    }

}

require("github-theme").setup({
    options = {
        function_style = "italic",
        darken = {
            sidebars =  {
                enable = false,
                list = {"qf", "vista_kind", "terminal", "packer"},
            },
        },
        palettes = {
            
        },

    },
    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    -- colors = {hint = "#58da24", error = "#ff0000"},

    -- Overwrite the highlight groups
    --overrides = function(c)
    -- return {
        --htmlTag = {
            --fg = c.red, 
            --bg = "#282c34", 
            --sp = c.hint, 
           -- style = "underline"
        ---},
        ---DiagnosticHint = {
          --  link = "LspDiagnosticsDefaultHint"
        --},
        -- this will remove the highlight groups
        --TSField = {},
    -- }
    -- end
})

vim.cmd('colorscheme github_dark_dimmed')

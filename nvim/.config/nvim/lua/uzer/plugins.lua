-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  	-- Packer can manage itself
  	use 'wbthomason/packer.nvim'


    use 'projekt0n/github-nvim-theme'

    use 'kyazdani42/nvim-web-devicons'

  	-- Post-install/update hook with neovim command
  	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  	-- Telescope
	use 'nvim-lua/popup.nvim'
  	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'


    use 'kyazdani42/nvim-tree.lua'

    use 'kdheepak/tabline.nvim'
    use 'nvim-lualine/lualine.nvim'

    -- GIT
    use 'tpope/vim-fugitive'        -- Vim-fugitive   
    use 'lewis6991/gitsigns.nvim'   -- GitSigns

    -- LANGUAGE SERVER
    use 'neovim/nvim-lspconfig'


    -- AUTOCOMPLETION
    -- TODO: point to this branch until the border window will be merged to main
    use {'hrsh7th/nvim-cmp'}          -- Completion framework 
    use 'hrsh7th/cmp-nvim-lsp'      -- LSP completion source for nvim-cmp
    use 'hrsh7th/cmp-nvim-lua' 
    use 'hrsh7th/cmp-nvim-lsp-signature-help' 

    use 'hrsh7th/cmp-vsnip'         -- Snippet completion source for nvim-cmp
    use 'hrsh7th/vim-vsnip'         -- Snippet engine
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'glepnir/lspsaga.nvim'
    use 'ray-x/lsp_signature.nvim'

    -- PROGRAMMING LANGUAGES 
    use 'simrat39/rust-tools.nvim' -- Enable features such as inlay hints...
  
    use "jose-elias-alvarez/null-ls.nvim"
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use  "p00f/clangd_extensions.nvim"
   
    -- DEBUGGING
    use 'mfussenegger/nvim-dap'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'rcarriga/nvim-dap-ui'
    use 'mfussenegger/nvim-dap-python'
    use 'nvim-telescope/telescope-dap.nvim'
    use 'leoluz/nvim-dap-go'


    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

end)

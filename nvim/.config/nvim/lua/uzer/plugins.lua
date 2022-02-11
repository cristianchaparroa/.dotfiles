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

    use 'tpope/vim-fugitive'        -- Vim-fugitive   
    use 'lewis6991/gitsigns.nvim'   -- GitSigns

    use 'neovim/nvim-lspconfig'


    -- AUTOCOMPLETION
    -- TODO: point to this branch until the border window will be merged to main
    use {'hrsh7th/nvim-cmp', branch='border-window'}          -- Completion framework 
    use 'hrsh7th/cmp-nvim-lsp'      -- LSP completion source for nvim-cmp
    use 'hrsh7th/cmp-vsnip'         -- Snippet completion source for nvim-cmp
    use 'hrsh7th/vim-vsnip'         -- Snippet engine
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'

end)

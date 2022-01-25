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
end)

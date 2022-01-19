local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Dracula theme
  use {'dracula/vim', as = 'dracula'} 
  use {'tiagovla/tokyodark.nvim', as = 'tokyodark'}

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
     requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
  }
  
  -- Telescope Extensions
  use 'kyazdani42/nvim-web-devicons'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Lightline
  -- use 'itchyny/lightline.vim'
  use {
   'nvim-lualine/lualine.nvim',
   requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }


  -- Vim-fugitive
  use 'tpope/vim-fugitive'

  -- GitSigns
  use 'lewis6991/gitsigns.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- GO
  use 'fatih/vim-go'

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'onsails/lspkind-nvim'

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter',  run =  ':TSUpdate' }


  -- Nvim TREE
  -- use 'kyazdani42/nvim-tree.lua'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }

  use {'neoclide/coc.nvim', branch = 'release'}

  -- http://neovimcraft.com/plugin/kdheepak/tabline.nvim/index.html
  use 'kdheepak/tabline.nvim'

 
  -- lsp signature
  use 'ray-x/lsp_signature.nvim'


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

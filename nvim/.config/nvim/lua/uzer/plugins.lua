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
    use 'projekt0n/github-nvim-theme'

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- Telescope Extensions
    use 'kyazdani42/nvim-web-devicons'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { "nvim-telescope/telescope-file-browser.nvim" }
  
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    
    -- TABLINE to use buffers as tabs
    -- http://neovimcraft.com/plugin/kdheepak/tabline.nvim/index.html
    use 'kdheepak/tabline.nvim'
    

    -- TREE for nvim
    use 'kyazdani42/nvim-tree.lua'
    
    -- GIT
    use 'tpope/vim-fugitive'        -- Vim-fugitive   
    use 'lewis6991/gitsigns.nvim'   -- GitSigns

    -- LANGUAGE SERVER PROTOCOL
    use 'neovim/nvim-lspconfig'
    use 'ray-x/lsp_signature.nvim'  -- lsp signature

    -- Treesitter is a parser generator tool and incremental parsing library.
    use {'nvim-treesitter/nvim-treesitter',  run =  ':TSUpdate' }

    -- LANGUAGES 
    use 'fatih/vim-go'              -- GO
    use 'simrat39/rust-tools.nvim'  -- to enable features of rust-analyzer, such inlay hints etc...

    -- AUTOCOMPLETION
    use 'hrsh7th/nvim-cmp'                          -- Completion framework 
    use 'hrsh7th/cmp-nvim-lsp'                      -- LSP completion source for nvim-cmp
    use 'hrsh7th/cmp-vsnip'                         -- Snippet completion source for nvim-cmp
    use 'hrsh7th/vim-vsnip'                         -- Snippet engine
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'


    use 'L3MON4D3/LuaSnip'                          -- snippet engine
    use 'saadparwaiz1/cmp_luasnip'                  -- luasnip completion source for nvim-cmp
    use 'onsails/lspkind-nvim'                      -- adds pictograms to nvim built-in lsp
 
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

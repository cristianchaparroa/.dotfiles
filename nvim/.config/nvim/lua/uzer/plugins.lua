-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function()
  	-- Packer can manage itself
  	use 'wbthomason/packer.nvim'


    use 'projekt0n/github-nvim-theme'
    use 'kyazdani42/nvim-web-devicons'

    use { "catppuccin/nvim", as = "catppuccin" }

  	-- Post-install/update hook with neovim command
  	use { 'nvim-treesitter/nvim-treesitter', 
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

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
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
    use 'mfussenegger/nvim-dap-python'
    use 'nvim-telescope/telescope-dap.nvim'
    use 'leoluz/nvim-dap-go'


    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
       require('packer').sync()
    end
end)

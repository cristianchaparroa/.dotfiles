vim.opt.autoindent=true              -- indent a new line the same amount as the line just typed
--vim.opt.cc=80                   -- set an 80 column border for good coding style
vim.opt.cursorline=true              -- highlight current cursorline
--vim.opt.clipboard=unnamedplus   -- using system clipboard
vim.opt.expandtab=true               -- converts tabs to white space
vim.opt.hlsearch=true                -- highlight search
vim.opt.ignorecase=true              -- case insensitive
vim.opt.incsearch=true               -- incremental search
-- vim.opt.mouse=v             -- middle-click paste with
-- vim.opt.mouse=a                  -- enable mouse click
--set nocompatible                  -- disable compatibility to old-time vi
vim.opt.number=true                 -- add line numbers
vim.opt.showmatch=true              -- show matching
vim.opt.softtabstop=4               -- see multiple spaces as tabstops so <BS> does the right thing
vim.opt.shiftwidth=4                -- width for autoindents
vim.opt.smartcase=true
vim.opt.ttyfast=true                -- Speed up scrolling in Vim
vim.opt.tabstop=4                   -- number of columns occupied by a tab
 --set wildmode=longest,list        -- get bash-like tab completions
vim.opt.spell=true                  -- enable spell check (may need to download language package)
-- vim.opt.backupdir=~/.cache/vim -- Directory to store backup files.
--
vim.opt.termguicolors = true
vim.cmd('colorscheme github_*')
vim.cmd('set noswapfile')           --disable creating swap file
vim.cmd('set mouse=a')
vim.cmd('set noshowmode')
vim.cmd('set signcolumn=number')
vim.cmd('set encoding=UTF-8')
vim.cmd('set backupdir=~/.cache/vim')

vim.cmd('set guioptions+=a')        -- when is select on yank it put in the clipboard

-- Set completeopt to have a better completion experience
-- :help completeopt
--
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
vim.o.completeopt = 'menuone,noinsert,noselect'

-- Avoid showing extra messages when using completion
vim.cmd('set shortmess+=c')

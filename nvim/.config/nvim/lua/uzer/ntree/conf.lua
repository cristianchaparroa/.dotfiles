vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local ntree = require('nvim-tree')

ntree.setup({
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = false,
    ignore = true,
    timeout = 100, -- milliseconds
  },
  view = {
    width = 30,
    -- height = 30,
    -- hide_root_folder = false,
    side = 'left',
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  actions = {
    open_file = {
        resize_window = true
    }
  }
})



-- 文件目录

local function on_attach(bufnr)
  local api = require("nvim-tree.api")
  api.config.mappings.default_on_attach(bufnr)
  local opt = { buffer = bufnr, noremap = true, silent = true, nowait = true }
  -- custom mappings
  local map = vim.keymap.set
  map('n', '<C-b>', api.tree.toggle,                opt)
  map('n', '<C-t>', api.tree.change_root_to_parent, opt)
  map('n', '<C-s>', "<Nop>",                        opt)
  map('n', 'l',     api.node.open.edit,             opt)
  map('n', '?',     api.tree.toggle_help,           opt)
end

local opt = {
  sort      = { sorter = "case_sensitive", },
  view      = { width = 30, },
  renderer  = { group_empty = true,icons = { glyphs = { default = ""} } },
  filters   = { dotfiles = true, },
  actions   = { open_file = { quit_on_open = false } },
  on_attach = on_attach,
}

local setup = function()
  require('nvim-tree').setup(opt)
  vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', {noremap = true, silent = true })
end
return {
  'nvim-tree/nvim-tree.lua',
  config = setup,
}

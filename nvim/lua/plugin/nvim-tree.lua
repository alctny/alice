-- 文件目录

local function on_attach(bufnr)
  local api = require("nvim-tree.api")
  api.config.mappings.default_on_attach(bufnr)
  local opt = { buffer = bufnr, noremap = true, silent = true, nowait = true }
  local map = vim.keymap.set
  api.tree.change_root_to_parent = function() end -- 禁止路径穿越
  map("n", "l",          api.node.open.preview,          opt)
  map("n", "h",          api.node.navigate.parent,       opt)
  map("n", "e",          api.node.open.edit,             opt)
  map("n", "H",          api.node.open.horizontal,       opt)
  map("n", "V",          api.node.open.vertical,         opt)
  map("n", "<BS>",       api.node.navigate.parent_close, opt)
  map("n", "<C-b>",      api.tree.toggle,                opt)
  map("n", "?",          api.tree.toggle_help,           opt)
  map("n", "yn",         api.fs.copy.filename,           opt)
  map("n", "<F2>",       api.fs.rename_node,             opt)
  map("n", "<C-s>",      "<Nop>",                        opt)
end

local opt = {
  sort      = { sorter = "case_sensitive" },
  view      = { width = 37 },
  filters   = { dotfiles = true },
  renderer  = { root_folder_label = false },
  on_attach = on_attach,
  actions   = {
    open_file = { 
      quit_on_open = true, 
      window_picker = { enable = false },
    },
  },
}

vim.keymap.set("n", "<C-b>", ":NvimTreeFindFile<CR>", {noremap = true, silent = true })

return {
  "nvim-tree/nvim-tree.lua",
  main = "nvim-tree",
  opts = opt,
}

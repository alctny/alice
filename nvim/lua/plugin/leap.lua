-- 页面内快速跳转

local setup = function()
  local leap = require("leap")
  leap.opts.default_mappings = false
  local map = vim.keymap.set
  map("n",        "<leader>j", "<Plug>(leap)")
  map("n",        "<leader>J", "<Plug>(leap-from-window)")
  map({"x", "o"}, "<leader>j", "<Plug>(leap-forward)")
  map({"x", "o"}, "<leader>J", "<Plug>(leap-backward)")
end

return { "ggandor/leap.nvim", config=setup }

-- 页面内快速跳转

local setup = function()
  local leap = require('leap')
  leap.opts.default_mappings = false
  local map = vim.keymap.set
  map('n',        '<leader>S', '<Plug>(leap)')
  map('n',        '<leader>s', '<Plug>(leap-from-window)')
  map({'x', 'o'}, '<leader>s', '<Plug>(leap-forward)')
  map({'x', 'o'}, '<leader>S', '<Plug>(leap-backward)')
end

return { "ggandor/leap.nvim", config = setup }

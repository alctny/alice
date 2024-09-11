-- 一个超级搜索功能

local setup = function()
  local ts = require('telescope.builtin')
  local map = vim.keymap.set
  map('n', '<C-p>',      ts.commands,                  {})
  map('n', '<leader>fc', ts.commands,                  {})
  map('n', '<leader>ff', ts.find_files,                {})
  map('n', '<leader>fl', ts.live_grep,                 {})
  map('n', '<leader>fb', ts.buffers,                   {})
  map('n', '<leader>fs', ts.current_buffer_fuzzy_find, {})
  map('n', '<leader>fS', ts.grep_string,               {})
  map('n', '<leader>fm', ts.pickers,                   {})
  map('n', '<leader>?',  ts.help_tags,                {})
end

return { 
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = setup,
}

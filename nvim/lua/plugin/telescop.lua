-- 一个超级搜索功能

local setup = function()
  local ts = require("telescope.builtin")
  local map = vim.keymap.set
  local opt = {noremap = true, silent = true }
  map("n", "<C-p>",      ts.buffers,                   opt)
  map("n", "<leader><leader>", ts.find_files,                opt)
  map("n", "<leader>fl", ts.live_grep,                 opt)
  map("n", "<leader>fs", ts.current_buffer_fuzzy_find, opt)
  -- map("n", "<leader>fS", ts.grep_string,               opt)
  -- map("n", "<leader>fm", ts.pickers,                   opt)
  map("n", "<leader>?",  ts.help_tags,                 opt)
  map("n", "<leader>:",  ts.command_history,           opt)
end

return { 
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = setup,
}

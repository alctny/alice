-- 一个超级搜索功能

local setup = function()
  local ts = require("telescope.builtin")
  local map = vim.keymap.set
  local opt = {noremap = true, silent = true }
  map("n", "<C-p>",            ts.buffers,                   opt)
  map("n", "<leader><leader>", ts.find_files,                opt)
  map("n", "<leader>fl",       ts.live_grep,                 opt)
  map("n", "<leader>fs",       ts.current_buffer_fuzzy_find, opt)
  map("n", "<leader>f*",       function() ts.grep_string({grep_open_files = true}) end,               opt)
  map("n", "<leader>fm",       ts.pickers,                   opt)
  map("n", "<leader>fh",       ts.command_history,           opt)
  map("n", "<leader>*",        ts.resume,                    opt)
  map("n", "<leader>>",        ts.treesitter,                opt)
  map("n", "<leader>?",        ts.help_tags,                 opt)
  map("n", "<leader>:",        ts.builtin,                   opt)
end

return { 
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = setup,
}

-- 主题

local setup = function()
  vim.cmd [[colorscheme gruvbox ]]
end

return {
  { "ellisonleao/gruvbox.nvim", config = setup, cond = true },
  { "folke/tokyonight.nvim",    config = setup, cond = false },
}


-- 主题

local setup = function()
  vim.cmd [[colorscheme catppuccin-mocha ]]
end

return {
  { "ellisonleao/gruvbox.nvim", config = setup, cond = true },
  { "folke/tokyonight.nvim",    config = setup, cond = false },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}


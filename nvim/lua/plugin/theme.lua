-- 主题

local setup = function()
  vim.cmd [[colorscheme tokyonight-night ]]
end

return {
  { "ellisonleao/gruvbox.nvim", config = setup, cond = false },
  { "folke/tokyonight.nvim",    config = setup, cond = true },
}


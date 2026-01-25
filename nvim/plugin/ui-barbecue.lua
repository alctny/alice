-- 在文件上方提供一个类似 VSCode 的当前文件内位置提示
-- 需要配置 LSP

local setup = function()
  require("barbecue.ui").toggle(true)
end

return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  opts = {},
  config = setup,
  dependencies = { 
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
}

-- 高亮光标当前所在单词

local setup = function()
  require('illuminate').configure()
end

return { "RRethy/vim-illuminate", event = "VeryLazy", config = setup }

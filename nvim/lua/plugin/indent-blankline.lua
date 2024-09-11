-- 使用竖线标识括号和缩进

local setup = function() 
  require("ibl").setup()
end

return { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}, config = setup}

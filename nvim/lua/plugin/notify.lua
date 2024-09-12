-- 更好的提示

local setup = function() 
  local notify = require("notify")
  notify.setup({ timeout = 1500 })
  vim.notify = notify
end

return { "rcarriga/nvim-notify", config = setup }

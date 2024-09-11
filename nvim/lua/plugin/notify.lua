-- 更好的提示

local opt = {
  timeout = 1500,
}

local setup = function() 
  local notify = require("notify")
  notify.setup(opt)
  vim.notify = notify
end

return { 'rcarriga/nvim-notify', config = setup }

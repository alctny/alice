-- 单独启动 nvim 时候提供一个 dashboard 页面，类似 VSCode 的欢迎页面
local setup = function()
  local dashboard = require("alpha.themes.dashboard")
  dashboard.section.header.val = {
    "                                                     ",
    "  ▄█     ▄████████  ▄█     █▄   ▄███████▄   ▄█   ▄█  ",
    " ███    ███    ███ ███     ███ ██▀     ▄██ ███  ███  ",
    " ███▌   ███    █▀  ███     ███       ▄███▀ ███▌ ███▌ ",
    " ███▌  ▄███▄▄▄     ███     ███  ▀█▀▄███▀▄▄ ███▌ ███▌ ",
    " ███▌ ▀▀███▀▀▀     ███     ███   ▄███▀   ▀ ███▌ ███▌ ",
    " ███    ███    █▄  ███     ███ ▄███▀       ███  ███  ",
    " ███    ███    ███ ███ ▄█▄ ███ ███▄     ▄█ ███  ███  ",
    " █▀     ██████████  ▀███▀███▀   ▀████████▀ █▀   █▀   ",
    "                                                     ",
  }
  dashboard.section.buttons.val = {}
  require("alpha").setup(dashboard.config)
end

return { "goolord/alpha-nvim", config = setup, enable = false, cond = false }

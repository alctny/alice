-- 文件管理器

local header = [[
                                                     
  ▄█     ▄████████  ▄█     █▄   ▄███████▄   ▄█   ▄█  
 ███    ███    ███ ███     ███ ██▀     ▄██ ███  ███  
 ███▌   ███    █▀  ███     ███       ▄███▀ ███▌ ███▌ 
 ███▌  ▄███▄▄▄     ███     ███  ▀█▀▄███▀▄▄ ███▌ ███▌ 
 ███▌ ▀▀███▀▀▀     ███     ███   ▄███▀   ▀ ███▌ ███▌ 
 ███    ███    █▄  ███     ███ ▄███▀       ███  ███  
 ███    ███    ███ ███ ▄█▄ ███ ███▄     ▄█ ███  ███  
 █▀     ██████████  ▀███▀███▀   ▀████████▀ █▀   █▀   
                                                     
]]

return {
	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				enabled = true,
				preset = {
					header = header,
					keys = {
						{ key = "q", action = ":qa", hidden = true },
						{ key = "n", action = ":ene | startinsert", hidden = true },
						{ key = "x", action = ":LazyExtras", hidden = true },
						{ key = "l", action = ":Lazy", hidden = true },
					},
				},
			},
		},
	},
}

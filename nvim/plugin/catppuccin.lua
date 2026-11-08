return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			transparent_background = false,
			integrations = {
				treesitter = true,
				native_lsp = { enabled = true },
				telescope = { enabled = true },
				nvimtree = true,
			},
		},
	},
	{ "LazyVim/LazyVim", opts = { colorscheme = "catppuccin-mocha" } },
}

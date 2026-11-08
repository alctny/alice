return {
	{
		"kevalin/mermaid.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		ft = { "mermaid" },
		opts = {
			preview = {
				port = 0,
				renderer = "mermaid.js",
				theme = "dark",
			},
			lint = {
				enabled = false,
			},
		},
		keys = {
			{
				"<leader>mp",
				"<cmd>MermaidPreview<CR>",
				desc = "Mermaid 即時預覽",
				ft = "mermaid",
			},
			{
				"<leader>mx",
				"<cmd>MermaidPreviewStop<CR>",
				desc = "停止 Mermaid 預覽",
				ft = "mermaid",
			},
		},
	},
}

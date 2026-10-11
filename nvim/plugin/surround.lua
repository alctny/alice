-- 在選中文本周圍快速添加括號或其他分割符

return {
	"kylechui/nvim-surround",
	version = "^4.0.0",
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({})
	end,
}

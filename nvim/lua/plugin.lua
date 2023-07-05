
local function install(use)
  use("wbthomason/packer.nvim")
  use("folke/tokyonight.nvim")
  use({"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons"})
	use({"akinsho/bufferline.nvim", requires = { "kyazdani44/nvim-web-devicons", "moll/vim-bbye"}})
end

return require("packer").startup(install)

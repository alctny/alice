local packer = require('packer')

packer.startup({
  function(use)
    use 'wbthomason/packer.nvim'

    -- 主题
    use("folke/tokyonight.nvim")
    -- 目录树
    use({"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
    -- 标签页
    use({"akinsho/bufferline.nvim", requires = {"kyazdani42/nvim-web-devicons", "moll/vim-bbye"}})
    -- 状态栏
    use({"nvim-lualine/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons"}})
    use("arkav/lualine-lsp-progress")
    -- 文件模糊查找
    use {'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim"}}
  end,

  config = {
    max_jobs = 8,
  },

})

-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)


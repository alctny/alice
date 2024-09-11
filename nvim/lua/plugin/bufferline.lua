-- 在顶部提供一个类似 VSCode 的 tab 页的形式显示 buffer 列表

local setup = function()
  local bl = require('bufferline')
  local kopt = {noremap = true, silent = true }
  local map = vim.keymap.set
  map("n", "<c-Tab>",    "<cmd>BufferLineCycleNext<CR>",    opt)
  map("n", "<S-Tab>",    "<cmd>BufferLineCyclePrev<CR>",    opt)
  map("n", "<leader>1",  "<cmd>BufferLineGoToBuffer 1<CR>", opt)
  map("n", "<leader>2",  "<cmd>BufferLineGoToBuffer 2<CR>", opt)
  map("n", "<leader>3",  "<cmd>BufferLineGoToBuffer 3<CR>", opt)
  map("n", "<leader>4",  "<cmd>BufferLineGoToBuffer 4<CR>", opt)
  map("n", "<leader>5",  "<cmd>BufferLineGoToBuffer 5<CR>", opt)
  map("n", "<leader>6",  "<cmd>BufferLineGoToBuffer 6<CR>", opt)
  map("n", "<leader>7",  "<cmd>BufferLineGoToBuffer 7<CR>", opt)
  map("n", "<leader>8",  "<cmd>BufferLineGoToBuffer 8<CR>", opt)
  map("n", "<leader>9",  "<cmd>BufferLineGoToBuffer 9<CR>", opt)

  map("n", "<C-w>",      "<cmd>bdelete<CR>",                opt)
  map("n", "<leader>bx", "<cmd>bdelete<CR>",                opt)
  map("n", "<leader>bl", "<cmd>BufferLineCycleNext<CR>",    opt)
  map("n", "<leader>bh", "<cmd>BufferLineCyclePrev<CR>",    opt)
  map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>",  opt)
  map("n", "<leader>bl", "<cmd>BufferLineCloseLeft<CR>",    opt)
  map("n", "<leader>br", "<cmd>BufferLineCloseRight<CR>",   opt)

  bl.setup({})
end

return { 'akinsho/bufferline.nvim', version = '*', dependencies = { 'nvim-tree/nvim-web-devicons' }, config = setup }

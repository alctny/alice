local keymap = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- nvim-tree 文件側邊欄
keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opt)

-- bufferline
-- 左右Tab切换
keymap("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
keymap("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
keymap("n", "<C-w>", ":Bdelete!<CR>", opt)
keymap("n", "<leader>rw", ":BufferLineCloseRight<CR>", opt)
keymap("n", "<leader>lw", ":BufferLineCloseLeft<CR>", opt)
keymap("n", "<leader>ow", ":BufferLinePickClose<CR>", opt)

-- 取消 s 默认功能
keymap("n", "s", "", opt)
-- windows 分屏快捷键
keymap("n", "sv", ":vsp<CR>", opt)
keymap("n", "sh", ":sp<CR>", opt)
-- 关闭当前
keymap("n", "sc", "<C-w>c", opt)
-- 关闭其他
keymap("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
keymap("n", "<A-h>", "<C-w>h", opt)
keymap("n", "<A-j>", "<C-w>j", opt)
keymap("n", "<A-k>", "<C-w>k", opt)
keymap("n", "<A-l>", "<C-w>l", opt)


keymap("i", "<C-a>", "<ESC>I", opt)
keymap("i", "<C-e>", "<ESC>A", opt)
keymap("n", "<C-a>", "I", opt)
keymap("n", "<C-e>", "A", opt)

-- 上下移动文本
keymap("n", "<A-Down>", ":m+<CR>", opt)
keymap("n", "<A-Up>", ":m-2<CR>", opt)
keymap("i", "<A-Down>", "<ESC>:m+<CR>a", opt)
keymap("i", "<A-Up>", "<ESC>:m-2<CR>a", opt)
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", opt)
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", opt)

-- Ctrl+s 保存文件
keymap("i", "<C-s>", "<ESC>:w<CR>a", opt)
keymap("n", "<C-s>", ":w<CR>", opt)

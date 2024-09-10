-- 快捷键绑定
local opt = {noremap = true, silent = true }
local map = vim.keymap.set
vim.o.timeoutlen = 500
vim.g.mapleader = " "

-- 禁用方向键
map({ "n", "i", "v" }, "<Left>",  "<Nop>", opt)
map({ "n", "i", "v" }, "<Right>", "<Nop>", opt)
map({ "n", "i", "v" }, "<Up>",    "<Nop>", opt)
map({ "n", "i", "v" }, "<Down>",  "<Nop>", opt)
-- 分屏
map("n", "<leader>v", ":sp<CR>",  opt)
map("n", "<leader>h", ":vsp<CR>", opt)
-- 关闭窗格
-- map("n", "<C-w>", "<C-w>c", opt)
-- map("n", "<C-o>", "<C-w>o", opt)
-- 窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- 窗格大小控制
map("n", "<leader><Left>",  "<cmd>vertical resize -2<CR>",  opt)
map("n", "<leader><Right>", "<cmd>vertical resize +2<CR>",  opt)
map("n", "<leader><Down>",  "<cmd>resize +2<CR>",           opt)
map("n", "<leader><Up>",    "<cmd>resize -2<CR>",           opt)
map("n", "<leader>[",       "<cmd>resize +10<CR>",          opt)
map("n", "<leader>]",       "<cmd>resize -10<CR>",          opt)
map("n", "<leader>,",       "<cmd>vertical resize -20<CR>", opt)
map("n", "<leader>.",       "<cmd>vertical resize +20<CR>", opt)
map("n", "<leader>0",       "<C-w>=",                       opt)
-- 终端
map("n", "<leader>t",  ":sp | terminal<CR>i",  opt)
map("n", "<leader>vt", ":vsp | terminal<CR>i", opt)
map("t", "<Esc>",      "<C-\\><C-n>",          opt)
map("t", "<A-h>",      [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>",      [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>",      [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>",      [[ <C-\><C-N><C-w>l ]], opt)
-- 编辑
map("n", "<C-s>",  "<cmd>w<CR>",       opt)
map("n", "<C-q>",  "<cmd>wq<CR>",      opt)
map("i", "<C-s>",  "<Esc><cmd>w<CR>i", opt)
map("i", "<C-q>",  "<Esc><cmd>wq<CR>", opt)
-- Emacs 快捷键
map("i", "<C-b>",  "<Left>",  opt)
map("i", "<C-f>",  "<Right>", opt)
map("i", "<C-p>",  "<Up>",    opt)
map("i", "<C-n>",  "<Down>",  opt)
map("i", "<C-a>",  "<Home>",  opt)
map("i", "<C-e>",  "<End>",   opt)
-- visual 模式下使用 >> <<
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "<A-Down>", "<cmd>move '>+1<CR>gv-gv",        opt)
map("v", "<A-Up>",   "<cmd>move '<-2<CR>gv-gv",        opt)
map("n", "<A-Down>", "v:move '>+1<CR>gv-gv<Esc>",      opt)
map("n", "<A-Up>",   "v:move '<-2<CR>gv-gv<Esc>",      opt)
map("i", "<A-Up>",   "<Esc>v:move '<-2<CR>gv-gv<Esc>", opt)
map("i", "<A-Down>", "<Esc>v:move '>+1<CR>gv-gv<Esc>", opt)
-- 编辑模式下 C-v 自动粘贴
map("i", "<C-v>", "<Esc>pa", opt)
-- 自动复制到系统剪贴板
map({ "v", "n" }, "<leader>y", "\"+y", opt)


-- 快捷键绑定
local opt = {noremap = true, silent = true }
local map = vim.keymap.set

-- 禁用方向键
map({ "n", "i", "v" }, "<Left>",  "<Nop>", opt)
map({ "n", "i", "v" }, "<Right>", "<Nop>", opt)
map({ "n", "i", "v" }, "<Up>",    "<Nop>", opt)
map({ "n", "i", "v" }, "<Down>",  "<Nop>", opt)
map("n",               " ",       "<Nop>", opt)

-- 启用或禁用自动换行
map("n", "<A-z>", "<cmd>set wrap<CR>", opt)

-- 分屏
map("n", "<leader>v", ":sp<CR>",  opt)
map("n", "<leader>h", ":vsp<CR>", opt)

-- 关闭窗格
-- map("n", "<C-w>", "<C-w>c", opt)
-- map("n", "<C-o>", "<C-w>o", opt)
-- 窗口之间跳转
map("n", "<A-h>", "<C-w>h",      opt)
map("n", "<A-j>", "<C-w>j",      opt)
map("n", "<A-k>", "<C-w>k",      opt)
map("n", "<A-l>", "<C-w>l",      opt)
map("i", "<A-h>", "<Esc><C-w>h", opt)
map("i", "<A-j>", "<Esc><C-w>j", opt)
map("i", "<A-k>", "<Esc><C-w>k", opt)
map("i", "<A-l>", "<Esc><C-w>l", opt)

-- 窗格控制
map("n", "<leader-Left>",  ":vertical resize -2<CR>",  opt)
map("n", "<leader-Right>", ":vertical resize +2<CR>",  opt)
map("n", "<leader-Down>",  ":resize +2<CR>",           opt)
map("n", "<leader-Up>",    ":resize -2<CR>",           opt)
map("n", "<leader>[",      ":resize +10<CR>",          opt)
map("n", "<leader>]",      ":resize -10<CR>",          opt)
map("n", "<leader>,",      ":vertical resize -20<CR>", opt)
map("n", "<leader>.",      ":vertical resize +20<CR>", opt)
map("n", "<leader>0",      "<C-w>=",                   opt)

-- 终端
map("n", "<leader>t",  "<cmd>sp | terminal<CR>:resize 13<CR>i", opt)
map("n", "<C-`>",      "<cmd>sp | terminal<CR>:resize 13<CR>i", opt)
map("n", "<leader>vt", "<cmd>vsp | terminal<CR>i", opt)
map("t", "<M-h>",      "<C-\\><C-N><C-w>h",        opt)
map("t", "<M-j>",      "<C-\\><C-N><C-w>j",        opt)
map("t", "<M-k>",      "<C-\\><C-N><C-w>k",        opt)
map("t", "<M-l>",      "<C-\\><C-N><C-w>l",        opt)

-- 编辑
map("n", "<C-s>",   "<cmd>w<CR>",    opt)
map("i", "<C-s>",   "<C-o>:wa<CR>",  opt)
map("i", "<C-o>",   "<Esc>",         opt)

-- Like Emacs
map("i", "<C-b>",   "<Left>",    opt)
map("i", "<C-f>",   "<Right>",   opt)
map("i", "<C-p>",   "<Up>",      opt)
map("i", "<C-n>",   "<Down>",    opt)
map("i", "<C-a>",   "<Home>",    opt)
map("i", "<C-e>",   "<End>",     opt)
map("i", "<C-u>",   "<C-o>c0",   opt)
map("i", "<C-k>",   "<C-o>c$",   opt)
map("n", "<C-k>",   "d$",        opt)
map("i", "<A-b>",   "<C-Left>",  opt)
map("i", "<A-f>",   "<C-Right>", opt)
map("i", "<C-j>",   "<C-o>cc",   opt)
map("i", "<C-l>",   "<C-o>cc",   opt)

-- visual 模式下使用 >> <<
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- 上下移动选中文本
map("n", "<A-Up>",   "v:move '<-2<CR>gv-gv<Esc>",  opt)
map("n", "<A-Down>", "v:move '>+1<CR>gv-gv<Esc>",  opt)
map("v", "<A-Up>",   ":move '<-2<CR>gv-gv",        opt)
map("v", "<A-Down>", ":move '>+1<CR>gv-gv",            opt)
map("i", "<A-Up>",   "<Esc>v:move '<-2<CR>gv-gv<Esc>", opt)
map("i", "<A-Down>", "<Esc>v:move '>+1<CR>gv-gv<Esc>", opt)

-- 编辑模式下 C-v 自动粘贴
map("i", "<C-v>", "<Esc>pa", opt)

-- 自动复制到系统剪贴板
map({ "v", "n" }, "<leader>y", "\"+y", opt)


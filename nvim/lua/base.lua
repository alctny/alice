local opt = vim.opt
local win = vim.wo
local buf = vim.bo

-------------------------------------------- option --------------------------------------------
-- leader 键
vim.o.timeoutlen = 500
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- 文件编码
opt.fileencoding = "utf-8"
-- zt tb 在光标所在行留出指定行
opt.scrolloff = 4
opt.sidescrolloff = 4
-- tab size
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftround = true
opt.backspace = { "indent", "eol", "start" }
-- >> << 时移动长度
opt.shiftwidth = 2
-- 空格替代tab
opt.expandtab = true
-- 新行对齐当前行
opt.autoindent = true
opt.smartindent = true
-- 大小写不敏感
opt.ignorecase = true
opt.smartcase = true
-- 搜索
opt.incsearch = true
opt.hlsearch = false
-- 底行高度
opt.cmdheight = 0
-- 文件被外部修改时自动加载变化
opt.autoread = true
-- 禁止创建备份文件
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.updatetime = 50
-- undo and redo
-- opt.undofile = true
-- opt.undodir = vim.fn.expand("$HOME/.local/share/nvim/undo")
-- 使用系统剪贴板
opt.clipboard = "unnamedplus"
-- 显示不可见字符
opt.list = true
opt.listchars = "space:·"
-- 关闭默认状态栏显示
opt.showmode = true
-- 允许隐藏修改过的 buffer
opt.hidden = true
opt.showtabline = 2
opt.completeopt = "menu,menuone,noselect,noinsert"
-- 自动更新 vim 窗口标题
opt.title = true
-- 启用真彩色
opt.termguicolors = true
-- 自动补全
opt.wildmenu = true
opt.completeopt = { "menuone", "noselect" }
-- 允许通过 .nvim.lua 为不同的项目启动本地配置
opt.exrc = true
-- 单行模式
opt.wrap = false
-- split 窗口位置
opt.splitright = true
opt.splitbelow = true

-------------------------------------------- windows --------------------------------------------
-- 左侧流出额外一列
win.signcolumn = "yes"
-- 相对行号
win.number = true
win.relativenumber = true
-- 高亮所在行
win.cursorline = true
win.cursorcolumn = true

--------------------------------------------   buf   --------------------------------------------
-- 自动加载被修改过的文件
buf.autoread = true
-- 自动缩进
buf.autoindent = true
-- 缩进
buf.expandtab = true
buf.shiftwidth = 2
buf.tabstop = 2

-- "                                                     ",
-- "  ▄█     ▄████████  ▄█     █▄   ▄███████▄   ▄█   ▄█  ",
-- " ███    ███    ███ ███     ███ ██▀     ▄██ ███  ███  ",
-- " ███▌   ███    █▀  ███     ███       ▄███▀ ███▌ ███▌ ",
-- " ███▌  ▄███▄▄▄     ███     ███  ▀█▀▄███▀▄▄ ███▌ ███▌ ",
-- " ███▌ ▀▀███▀▀▀     ███     ███   ▄███▀   ▀ ███▌ ███▌ ",
-- " ███    ███    █▄  ███     ███ ▄███▀       ███  ███  ",
-- " ███    ███    ███ ███ ▄█▄ ███ ███▄     ▄█ ███  ███  ",
-- " █▀     ██████████  ▀███▀███▀   ▀████████▀ █▀   █▀   ",
-- "                                                     ",


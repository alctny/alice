-- 文件编码
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

-- zt tb 在光标所在行留出 8 行
vim.o.scrolloff = 4
vim.o.sidescrolloff = 4

-- 相对行号
vim.wo.number = true
vim.wo.relativenumber = true

-- 高亮所在行
vim.wo.cursorline = true
vim.wo.cursorcolumn = true

-- tab size
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true

-- >> << 时移动长度
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true

-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true


-- 大小写不敏感
vim.o.ignorecase = true
vim.o.smartcase = true

-- 搜索
vim.o.incsearch = true
vim.o.hlsearch = false

-- 底行高度
vim.o.cmdheight = 0

-- 文件被外部修改时自动加载变化
vim.o.autoread = true
vim.bo.autoread = true

-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- 使用系统剪贴板
vim.opt.clipboard = 'unnamedplus'

-- 显示不可见字符
vim.o.list = true
vim.o.listchars = "space:·"

-- 关闭默认状态栏显示
vim.o.showmode = false

-- 左侧流出额外一列
vim.wo.signcolumn = "yes"
-- 允许隐藏修改过的 buffer
vim.o.hidden = true
vim.g.completeopt = "menu,menuone,noselect,noinsert"
vim.o.showtabline = 2

-- 启用真彩色
vim.opt.termguicolors = true
-- 设置颜色主题
-- vim.cmd [[colorscheme tokyonight-night ]]


vim.keymap.set('n', '<leader>l', ':Lazy<CR>', { noremap = true, silent = true })

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.api.nvim_echo({'cloning lazy.nvim...'}, true, {})
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' }},
      true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  install = { colorscheme = { 'tokyonight-night' } },
  checker = { enabled = false },
  config  = { notify = false },
  spec    = { import = 'plugin' },
})

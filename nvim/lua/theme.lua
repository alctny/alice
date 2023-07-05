local theme = "tokyonight-night"

local ok, _ = pcall(vim.cmd, "colorscheme " .. theme)
if not ok then
  vim.notify("set theme" .. theme .. "faild")
  return
end

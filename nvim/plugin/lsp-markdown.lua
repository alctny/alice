-- Markdown
return {
  {"tadmccorkle/markdown.nvim", ft = "markdown"},
  {"ellisonleao/glow.nvim", config = true, cmd = "Glow", ft = "markdown"},
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}

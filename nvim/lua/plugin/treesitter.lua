-- 语义分析与高亮

local opt = {
  ensure_installed = {
    "asm",
    "rust",
    "python",
    "c", "cpp", "cmake",
    "go", "gomod", "gosum", "gotmpl", "gowork",
    "html", "css", "javascript",
    "perl", "bash", "lua",

    "git_config", "git_rebase", "gitcommit", "gitignore", "gitattributes",
    "dockerfile", "sql",
    "diff", "markdown",
    "json", "json5", "yaml", "toml", "tmux", "ini",
  },
  highlight = { enable = true },
  indent = { enable = true },
  playground = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      selection_modes = {
        ["@parameter.outer"] = "v",
        ["@function.outer"] = "V",
        ["@class.outer"] = "<c-v>",
      },
      include_surrounding_whitespace = false,
    },
  },

}

return {
  "nvim-treesitter/nvim-treesitter",
  main = "nvim-treesitter.configs",
  opts = opt,
  dependencies = {
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
}

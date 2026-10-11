
function on_attach()
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end
  local list_folders = function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end
  local format = function()
      vim.lsp.buf.format { async = true }
  end

  nmap("gD",         vim.lsp.buf.declaration,                         "[G]oto [D]eclaration")
  nmap("gd",         require "telescope.builtin".lsp_definitions,     "[G]oto [D]efinition")
  nmap("K",          "<cmd>Lspsaga hover_doc<CR>",                    "Hover Documentation")
  nmap("gi",         require "telescope.builtin".lsp_implementations, "[G]oto [I]mplementation")
  nmap("<C-k>",      vim.lsp.buf.signature_help,                      "Signature Documentation")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder,                "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder,             "[W]orkspace [R]emove Folder")
  nmap("<leader>wl", list_folders,                                    "[W]orkspace [L]ist Folders")
  nmap("<leader>D",  vim.lsp.buf.type_definition,                     "Type [D]efinition")
  nmap("<leader>rn", "<cmd>Lspsaga rename ++project<cr>",             "[R]e[n]ame")
  nmap("<leader>ca", "<cmd>Lspsaga code_action<CR>",                  "[C]ode [A]ction")
  nmap("<leader>da", require "telescope.builtin".diagnostics,         "[D]i[A]gnostics")
  nmap("gr",         require("telescope.builtin").lsp_references,     "[G]oto [R]eferences")
  -- nmap("gr",         vim.lsp.buf.references,                          "[G]oto [R]eferences")
  nmap("<space>f",   format,                                          "[F]ormat code")
  nmap("<C-S-i>",   format,                                          "[F]ormat code")
end

return {
  "neovim/nvim-lspconfig",
  config = function()
    require("lspconfig").pyright.setup({})
  end,
  on_attach = on_attach,
}

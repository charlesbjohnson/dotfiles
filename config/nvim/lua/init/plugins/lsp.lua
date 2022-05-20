-- jose-elias-alvarez/null-ls.nvim
require("init.plugins.lsp.null-ls")

-- williamboman/nvim-lsp-installer
require("nvim-lsp-installer").setup({
  automatic_installation = true,
})

-- neovim/nvim-lspconfig
require("init.plugins.lsp.lspconfig")({
  -- hrsh7th/cmp-nvim-lsp
  capabilities = vim.tbl_deep_extend(
    "force",
    require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    {
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = true,
          },
        },
      },
    }
  ),

  handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "shadow" }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "shadow" }),
  },

  on_attach = function(client)
    -- RRethy/vim-illuminate
    require("illuminate").on_attach(client)
  end,
})

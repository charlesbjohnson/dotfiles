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

  on_attach = function(client)
    -- RRethy/vim-illuminate
    require("illuminate").on_attach(client)

    -- ray-x/lsp_signature.nvim
    require("lsp_signature").on_attach({
      bind = true,
      handler_opts = { border = "none" },
      hint_enable = false,
    })
  end,
})

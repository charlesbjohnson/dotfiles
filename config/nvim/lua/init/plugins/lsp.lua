-- hrsh7th/nvim-cmp
require("cmp").setup({
  mapping = {
    ["<CR>"] = require("cmp").mapping.confirm(),
    ["<C-e>"] = require("cmp").mapping.abort(),

    ["<C-b>"] = require("cmp").mapping.scroll_docs(-4),
    ["<C-f>"] = require("cmp").mapping.scroll_docs(4),

    ["<Tab>"] = require("cmp").mapping.select_next_item(),
    ["<S-Tab>"] = require("cmp").mapping.select_prev_item(),
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "buffer" },
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "nvim_lua" },
    { name = "path" },
  },
  window = {
    completion = {
      border = "shadow",
    },
    documentation = {
      border = "shadow",
    },
  },
})

-- jose-elias-alvarez/null-ls.nvim
require("init.plugins.lsp.null-ls")

-- williamboman/mason.nvim
require("mason").setup()

-- williamboman/mason-lspconfig.nvim
require("mason-lspconfig").setup({
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

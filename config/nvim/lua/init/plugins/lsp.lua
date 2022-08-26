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
require("init.plugins.lsp.lspconfig")(vim.tbl_deep_extend("force", {}, require("lspconfig").util.default_config, {
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

    ["window/logMessage"] = function(err, result, ctx, config)
      if result and result.type <= vim.lsp.protocol.MessageType.Log then
        vim.lsp.handlers["window/logMessage"](err, result, ctx, config)
      end
    end,

    ["window/showMessage"] = function(err, result, ctx, config)
      if result and result.type <= vim.lsp.protocol.MessageType.Warning then
        vim.lsp.handlers["window/showMessage"](err, result, ctx, config)
      end
    end,
  },
}))

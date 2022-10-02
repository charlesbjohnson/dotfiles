return function(options)
  require("lspconfig").solargraph.setup(vim.tbl_deep_extend("force", {}, options, {
    on_attach = function(client, ...)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      if options.on_attach then
        options.on_attach(client, ...)
      end
    end,

    root_dir = function(fname)
      return require("lspconfig.util").root_pattern("Gemfile", ".git")(fname)
        or require("lspconfig.util").path.dirname(fname)
    end,

    settings = {
      solargraph = {
        formatting = false,
      },
    },
  }))
end

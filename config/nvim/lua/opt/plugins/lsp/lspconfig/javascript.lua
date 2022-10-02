return function(options)
  require("lspconfig").tsserver.setup(vim.tbl_deep_extend("force", {}, options, {
    on_attach = function(client, ...)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      if options.on_attach then
        options.on_attach(client, ...)
      end
    end,

    root_dir = function(fname)
      return require("lspconfig.util").root_pattern("package.json", ".git")(fname)
        or require("lspconfig.util").path.dirname(fname)
    end,
  }))
end

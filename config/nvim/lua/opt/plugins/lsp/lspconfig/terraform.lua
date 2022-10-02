return function(options)
  require("lspconfig").terraformls.setup(vim.tbl_deep_extend("force", {}, options, {
    on_attach = function(client, ...)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      if options.on_attach then
        options.on_attach(client, ...)
      end
    end,
  }))
end

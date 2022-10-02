return function(options)
  require("lspconfig").html.setup(vim.tbl_deep_extend("force", {}, options, {
    filetypes = { "html", "eruby.html" },

    on_attach = function(client, ...)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      if options.on_attach then
        options.on_attach(client, ...)
      end
    end,
  }))
end

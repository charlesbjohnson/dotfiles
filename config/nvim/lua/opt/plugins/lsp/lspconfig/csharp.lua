return function(options)
  require("lspconfig").omnisharp.setup(vim.tbl_deep_extend("force", {}, options, {
    enable_roslyn_analyzers = true,
    enable_import_completion = true,

    on_attach = function(client, ...)
      client.server_capabilities.declarationProvider = false
      client.server_capabilities.definitionProvider = false
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
      client.server_capabilities.typeDefinitionProvider = false

      if options.on_attach then
        options.on_attach(client, ...)
      end
    end,
  }))

  require("lspconfig").csharp_ls.setup(vim.tbl_deep_extend("force", {}, options, {
    handlers = {
      ["textDocument/definition"] = require("csharpls_extended").handler,
    },

    on_attach = function(client, ...)
      client.server_capabilities.codeActionProvider = false
      client.server_capabilities.completionProvider = false
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
      client.server_capabilities.hoverProvider = false
      client.server_capabilities.renameProvider = false
      client.server_capabilities.signatureHelpProvider = false

      if options.on_attach then
        options.on_attach(client, ...)
      end
    end,
  }))
end

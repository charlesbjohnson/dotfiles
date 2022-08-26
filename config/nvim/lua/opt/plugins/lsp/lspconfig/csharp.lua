return function(options)
  require("lspconfig").omnisharp.setup(vim.tbl_deep_extend("force", {}, options, {
    enable_roslyn_analyzers = true,
    enable_import_completion = true,

    on_attach = function(client)
      -- TODO: https://old.reddit.com/r/neovim/comments/u5si2w/breaking_changes_inbound_next_few_weeks_for/
      client.resolved_capabilities.declaration = false
      client.resolved_capabilities.definition = false
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      client.resolved_capabilities.type_definition = false

      if options.on_attach then
        options.on_attach(client)
      end
    end,
  }))

  require("lspconfig").csharp_ls.setup(vim.tbl_deep_extend("force", {}, options, {
    handlers = {
      ["textDocument/definition"] = require("csharpls_extended").handler,
    },

    on_attach = function(client)
      -- TODO: https://old.reddit.com/r/neovim/comments/u5si2w/breaking_changes_inbound_next_few_weeks_for/
      client.resolved_capabilities.code_action = false
      client.resolved_capabilities.completion = false
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      client.resolved_capabilities.hover = false
      client.resolved_capabilities.rename = false
      client.resolved_capabilities.signature_help = false

      if options.on_attach then
        options.on_attach(client)
      end
    end,
  }))
end

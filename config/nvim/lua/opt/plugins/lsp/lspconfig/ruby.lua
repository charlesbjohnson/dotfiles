return function(options)
  require("lspconfig").solargraph.setup(vim.tbl_deep_extend("force", {}, options, {
    on_attach = function(client)
      -- TODO: https://old.reddit.com/r/neovim/comments/u5si2w/breaking_changes_inbound_next_few_weeks_for/
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false

      if options.on_attach then
        options.on_attach(client)
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

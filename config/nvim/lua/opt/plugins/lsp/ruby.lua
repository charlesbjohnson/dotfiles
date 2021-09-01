local util = require("lspconfig.util")

return function()
  return {
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
    end,

    root_dir = function(fname)
      return util.root_pattern("Gemfile", ".git")(fname) or util.path.dirname(fname)
    end,

    settings = {
      solargraph = {
        formatting = false,
      },
    },
  }
end

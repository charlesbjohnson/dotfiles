local util = require("lspconfig.util")

return function()
  return {
    -- Forcefully disable formatting
    capabilities = vim.tbl_extend("force", vim.lsp.protocol.make_client_capabilities(), {
      textDocument = {
        formatting = {
          dynamicRegistration = true
        }
      }
    }),

    root_dir = function(fname)
      return util.root_pattern("Gemfile", ".git")(fname) or util.path.dirname(fname)
    end,

    settings = {
      solargraph = {
        formatting = false
      }
    }
  }
end

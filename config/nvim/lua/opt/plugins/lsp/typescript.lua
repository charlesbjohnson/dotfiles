local lspconfig_u = require("lspconfig.util")

return function()
  return {
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
    end,

    root_dir = function(fname)
      return lspconfig_u.root_pattern("package.json", ".git")(fname) or lspconfig_u.path.dirname(fname)
    end,
  }
end

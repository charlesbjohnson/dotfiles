local lspnull = require("null-ls")
local sources = require.tree("init.plugins.lsp.null-ls")

return function()
  for _, source in pairs(sources) do
    if type(source) == "function" then
      source(lspnull.register)
    end
  end

  return {}
end

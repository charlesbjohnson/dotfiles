local providers = require.tree("init.plugins.lsp.diagnosticls")

return function()
  local setup = {
    filetypes = {},

    init_options = {
      linters = {},
      filetypes = {},

      formatters = {},
      formatFiletypes = {},
    },
  }

  for _, provider in pairs(providers) do
    if type(provider) == "function" then
      provider(setup)
    end
  end

  return setup
end

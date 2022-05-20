return function(options)
  require("opt.plugins.lsp.lspconfig.json")(options)
  require("opt.plugins.lsp.lspconfig.shell")(options)
  require("opt.plugins.lsp.lspconfig.lua")(options)

  for _, server in pairs(require.tree("init.plugins.lsp.lspconfig")) do
    server(options)
  end
end

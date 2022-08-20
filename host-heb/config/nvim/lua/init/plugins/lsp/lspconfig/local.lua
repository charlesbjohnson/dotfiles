return function(options)
  require("opt.plugins.lsp.lspconfig.docker")(options)

  require("opt.plugins.lsp.lspconfig.yaml")(options)
  require("opt.plugins.lsp.lspconfig.terraform")(options)

  require("opt.plugins.lsp.lspconfig.javascript")(options)
end

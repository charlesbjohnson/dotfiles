return function(options)
  require("opt.plugins.lsp.lspconfig.yaml")(options)

  require("opt.plugins.lsp.lspconfig.css")(options)
  require("opt.plugins.lsp.lspconfig.html")(options)

  require("opt.plugins.lsp.lspconfig.csharp")(options)
  require("opt.plugins.lsp.lspconfig.javascript")(options)
  require("opt.plugins.lsp.lspconfig.ruby")(options)
  require("opt.plugins.lsp.lspconfig.rust")(options)
end

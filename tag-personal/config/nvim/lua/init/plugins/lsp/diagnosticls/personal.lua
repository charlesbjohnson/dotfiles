return function(setup)
  require("opt.plugins.lsp.diagnosticls.fish")(setup)
  require("opt.plugins.lsp.diagnosticls.sh")(setup)

  require("opt.plugins.lsp.diagnosticls.json")(setup)
  require("opt.plugins.lsp.diagnosticls.yaml")(setup)

  require("opt.plugins.lsp.diagnosticls.go")(setup)
  require("opt.plugins.lsp.diagnosticls.javascript")(setup)
  require("opt.plugins.lsp.diagnosticls.ruby")(setup)

  require("opt.plugins.lsp.diagnosticls.css")(setup)
  require("opt.plugins.lsp.diagnosticls.html")(setup)
end

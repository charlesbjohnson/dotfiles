return function(setup)
  require("plugins.lsp.diagnosticls.fish")(setup)
  require("plugins.lsp.diagnosticls.sh")(setup)

  require("plugins.lsp.diagnosticls.json")(setup)
  require("plugins.lsp.diagnosticls.yaml")(setup)

  require("plugins.lsp.diagnosticls.javascript")(setup)
  require("plugins.lsp.diagnosticls.ruby")(setup)
end


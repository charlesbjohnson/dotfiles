return function(register)
  require("opt.plugins.lsp.null-ls.fish")(register)
  require("opt.plugins.lsp.null-ls.sh")(register)

  require("opt.plugins.lsp.null-ls.json")(register)
  require("opt.plugins.lsp.null-ls.yaml")(register)

  require("opt.plugins.lsp.null-ls.go")(register)
  require("opt.plugins.lsp.null-ls.javascript")(register)
  require("opt.plugins.lsp.null-ls.lua")(register)
  require("opt.plugins.lsp.null-ls.ruby")(register)

  require("opt.plugins.lsp.null-ls.css")(register)
  require("opt.plugins.lsp.null-ls.html")(register)
end

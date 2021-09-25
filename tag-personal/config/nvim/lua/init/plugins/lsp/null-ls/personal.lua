local M = {}

function M.registration(register)
  require("opt.plugins.lsp.null-ls.fish").registration(register)
  require("opt.plugins.lsp.null-ls.sh").registration(register)

  require("opt.plugins.lsp.null-ls.json").registration(register)
  require("opt.plugins.lsp.null-ls.yaml").registration(register)

  require("opt.plugins.lsp.null-ls.go").registration(register)
  require("opt.plugins.lsp.null-ls.javascript").registration(register)
  require("opt.plugins.lsp.null-ls.lua").registration(register)
  require("opt.plugins.lsp.null-ls.ruby").registration(register)

  require("opt.plugins.lsp.null-ls.css").registration(register)
  require("opt.plugins.lsp.null-ls.html").registration(register)
end

return M

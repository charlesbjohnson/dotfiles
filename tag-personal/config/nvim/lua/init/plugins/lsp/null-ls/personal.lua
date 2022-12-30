local M = {}

function M.registration(register)
  require("opt.plugins.lsp.null-ls.just").registration(register)

  require("opt.plugins.lsp.null-ls.css").registration(register)
  require("opt.plugins.lsp.null-ls.html").registration(register)

  require("opt.plugins.lsp.null-ls.csharp").registration(register)
  require("opt.plugins.lsp.null-ls.javascript").registration(register)
  require("opt.plugins.lsp.null-ls.ruby").registration(register)
end

function M.root_patterns()
  return vim.tbl_flatten({
    require("opt.plugins.lsp.null-ls.javascript").root_patterns(),
    require("opt.plugins.lsp.null-ls.ruby").root_patterns(),
  })
end

return M

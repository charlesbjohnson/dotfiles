local M = {}

function M.registration(register)
  require("opt.plugins.lsp.null-ls.terraform").registration(register)
  require("opt.plugins.lsp.null-ls.yaml").registration(register)

  require("opt.plugins.lsp.null-ls.javascript").registration(register)
end

function M.root_patterns()
  return vim.tbl_flatten({
    require("opt.plugins.lsp.null-ls.javascript").root_patterns(),
  })
end

return M

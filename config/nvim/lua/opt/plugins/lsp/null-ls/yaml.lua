local lspnull = require("null-ls")

local M = {}

function M.registration(register)
  register(lspnull.builtins.diagnostics.yamllint)
  register(lspnull.builtins.formatting.yq)
end

return M

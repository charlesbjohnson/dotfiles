local lspnull = require("null-ls")

local M = {}

function M.registration(register)
  register(lspnull.builtins.diagnostics.shellcheck)
  register(lspnull.builtins.formatting.shfmt)
end

return M

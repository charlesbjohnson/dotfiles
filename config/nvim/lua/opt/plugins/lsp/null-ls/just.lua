local lspnull = require("null-ls")

local M = {}

function M.registration(register)
  register(lspnull.builtins.formatting.just)
end

return M

local lspnull = require("null-ls")

local M = {}

function M.registration(register)
  register(lspnull.builtins.diagnostics.fish.with({
    diagnostics_format = "#{m} (#{s})",
  }))

  register(lspnull.builtins.formatting.fish_indent)
end

return M

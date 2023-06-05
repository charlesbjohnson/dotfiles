local lspnull = require("null-ls")

local M = {}

function M.registration(register)
  -- fish
  register(lspnull.builtins.diagnostics.fish.with({ diagnostics_format = "#{m} (#{s})" }))
  register(lspnull.builtins.formatting.fish_indent)

  -- sh
  register(lspnull.builtins.diagnostics.shellcheck)
  register(lspnull.builtins.code_actions.shellcheck)

  register(lspnull.builtins.formatting.shfmt)
end

return M

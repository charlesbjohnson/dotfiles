local lspnull = require("null-ls")

local M = {}

function M.registration(register)
  register(lspnull.builtins.diagnostics.golangci_lint.with({
    diagnostics_postprocess = function(diagnostic)
      diagnostic.code = diagnostic.source:match("^.+:(.+)$")
      diagnostic.source = diagnostic.source:match("^(.+):.+$")
      diagnostic.message = "[" .. diagnostic.code .. "] " .. diagnostic.message
      diagnostic.message = diagnostic.message .. " (" .. diagnostic.source .. ")"
    end,
  }))
end

function M.root_patterns()
  return { "go.mod" }
end

return M

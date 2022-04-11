local lspnull = require("null-ls")
local lspnull_h = require("null-ls.helpers")

local M = {}

function M.registration(register)
  register(lspnull.builtins.diagnostics.yamllint)
  register({
    filetypes = { "yaml" },
    method = lspnull.methods.FORMATTING,
    generator = lspnull_h.formatter_factory({
      command = "yq",
      args = ("--prettyPrint $FILENAME"):split(" "),
    }),
  })
end

return M

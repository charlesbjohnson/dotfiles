local lspnull = require("null-ls")

local M = {}

function M.registration(register)
  register(lspnull.builtins.diagnostics.yamllint)
  register({
    filetypes = { "yaml" },
    method = lspnull.methods.FORMATTING,
    generator = require("null-ls.helpers").formatter_factory({
      command = "yq",
      args = ("--prettyPrint $FILENAME"):split(" "),
    }),
  })
end

return M

local lspnull = require("null-ls")
local lspnull_h = require("null-ls.helpers")

local M = {}

function M.registration(register)
  register(lspnull.builtins.diagnostics.yamllint)

  register({
    method = lspnull.methods.FORMATTING,
    filetypes = { "yaml" },
    generator = lspnull_h.formatter_factory({
      command = "npm",
      args = ("exec --yes --parseable -- @fsouza/prettierd $FILENAME"):split(" "),
      to_stdin = true,
    }),
  })
end

return M

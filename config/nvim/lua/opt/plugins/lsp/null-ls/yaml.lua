local lspnull = require("null-ls")

local M = {}

function M.registration(register)
  register(lspnull.builtins.diagnostics.yamllint)

  register(lspnull.builtins.formatting.prettierd.with({
    filetypes = { "yaml" },
    command = "npm",
    args = ("exec --yes --parseable -- @fsouza/prettierd $FILENAME"):split(" "),
  }))
end

return M

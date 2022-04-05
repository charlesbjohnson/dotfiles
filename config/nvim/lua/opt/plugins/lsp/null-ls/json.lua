local lspnull = require("null-ls")

local M = {}

function M.registration(register)
  register(lspnull.builtins.formatting.prettierd.with({
    filetypes = { "json" },
    command = "npm",
    args = ("exec --yes --parseable -- @fsouza/prettierd $FILENAME"):split(" "),
  }))
end

return M

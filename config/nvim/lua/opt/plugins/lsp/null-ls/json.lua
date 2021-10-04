local lspnull = require("null-ls")
local lspnull_h = require("null-ls.helpers")

local M = {}

function M.registration(register)
  register({
    method = lspnull.methods.FORMATTING,
    filetypes = { "json" },
    generator = lspnull_h.formatter_factory({
      command = "npm",
      args = ("exec --yes --parseable -- @fsouza/prettierd $FILENAME"):split(" "),
      to_stdin = true,
    }),
  })
end

return M

local lspnull = require("null-ls")

local M = {}

function M.registration(register)
  register(lspnull.builtins.formatting.csharpier.with({
    command = "dotnet",
    args = ("csharpier --write-stdout"):split(" "),
  }))

  register(lspnull.builtins.formatting.xmllint)
end

return M

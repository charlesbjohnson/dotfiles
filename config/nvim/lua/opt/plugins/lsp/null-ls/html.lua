local lspnull = require("null-ls")

local M = {}

function M.registration(register)
  register(lspnull.builtins.formatting.prettierd.with({
    filetypes = { "html" },
    dynamic_command = function()
      return { "npx", "--quiet", "@fsouza/prettierd" }
    end,
  }))
end

return M

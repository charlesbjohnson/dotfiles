local lspnull = require("null-ls")

local M = {}

local filetypes = { "html", "eruby.html" }

function M.registration(register)
  register(lspnull.builtins.formatting.prettierd.with({
    dynamic_command = function()
      return { "npx", "--quiet", "@fsouza/prettierd" }
    end,

    filetypes = { "html", "eruby.html" },
  }))
end

return M

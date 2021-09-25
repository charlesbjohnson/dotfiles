local lspnull = require("null-ls")

local fs = require("fs")
local path = require("path")

local M = {}

local function use_selene()
  local current = vim.api.nvim_buf_get_name(0)
  if current == "" then
    current = path.cwd()
  end

  return fs.find_closest(current, { ".selene.toml", "selene.toml" })
end

function M.registration(register)
  local config = use_selene()
  if config then
    if string.ends_with(config, ".selene.toml") then
      register(lspnull.builtins.diagnostics.selene.with({ extra_args = { "--config", config } }))
    else
      register(lspnull.builtins.diagnostics.selene)
    end
  end

  register(lspnull.builtins.formatting.stylua)
end

return M

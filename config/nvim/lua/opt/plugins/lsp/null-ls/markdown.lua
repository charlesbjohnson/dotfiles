local lspnull = require("null-ls")

local fs = require("fs")
local path = require("path")

local M = {}

local function use_vale()
  local current = vim.api.nvim_buf_get_name(0)
  if current == "" then
    current = path.cwd()
  end

  local config = fs.find_closest(current, { ".vale.ini" })
  if config then
    return config
  end

  return nil
end

function M.registration(register)
  if use_vale() then
    register(lspnull.builtins.diagnostics.vale)
  end
end

function M.root_patterns()
  return { ".vale.ini" }
end

return M

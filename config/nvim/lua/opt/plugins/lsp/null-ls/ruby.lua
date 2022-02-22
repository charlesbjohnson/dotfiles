local lspnull = require("null-ls")

local fs = require("fs")
local path = require("path")

local M = {}

local function use_rubocop()
  local current = vim.api.nvim_buf_get_name(0)
  if current == "" then
    current = path.cwd()
  end

  return fs.find_closest(current, { ".rubocop.yml" })
end

function M.registration(register)
  if use_rubocop() then
    register(lspnull.builtins.diagnostics.rubocop)
    register(lspnull.builtins.formatting.rubocop)
  end
end

function M.root_patterns()
  return { "Gemfile" }
end

return M

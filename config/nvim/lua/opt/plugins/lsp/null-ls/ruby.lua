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
    register(lspnull.builtins.diagnostics.rubocop.with({
      prefer_local = true,
      dynamic_command = function()
        return { "bundle", "exec", "rubocop" }
      end,
    }))

    register(lspnull.builtins.formatting.rubocop.with({
      prefer_local = true,
      dynamic_command = function()
        return { "bundle", "exec", "rubocop" }
      end,
    }))

    return
  end

  register(lspnull.builtins.diagnostics.standardrb.with({
    dynamic_command = function()
      return { "gem", "exec", "--silent", "standardrb" }
    end,
  }))

  register(lspnull.builtins.formatting.standardrb.with({
    dynamic_command = function()
      return { "gem", "exec", "--silent", "standardrb" }
    end,
  }))
end

function M.root_patterns()
  return { "Gemfile" }
end

return M

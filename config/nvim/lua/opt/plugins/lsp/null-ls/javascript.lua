local lspnull = require("null-ls")

local fs = require("fs")
local path = require("path")

local M = {}

local function use_eslint()
  local current = vim.api.nvim_buf_get_name(0)
  if current == "" then
    current = path.cwd()
  end

  local config = fs.find_closest(current, { ".eslintrc.*" })
  if config then
    return config
  end

  config = fs.find_closest(current, { "package.json" })
  local pkg = string.parse_json(fs.read_file(config))
  if pkg and pkg.eslintConfig then
    return config
  end

  return nil
end

function M.registration(register)
  if use_eslint() then
    register(lspnull.builtins.diagnostics.eslint_d.with({
      dynamic_command = function()
        return { "npx", "--quiet", "eslint_d" }
      end,

      extra_filetypes = { "eruby.javascript" },
    }))

    register(lspnull.builtins.formatting.eslint_d.with({
      dynamic_command = function()
        return { "npx", "--quiet", "eslint_d" }
      end,

      extra_filetypes = { "eruby.javascript" },
    }))

    register(lspnull.builtins.code_actions.eslint_d.with({
      dynamic_command = function()
        return { "npx", "--quiet", "eslint_d" }
      end,

      extra_filetypes = { "eruby.javascript" },
    }))

    return
  end

  register(lspnull.builtins.formatting.prettierd.with({
    dynamic_command = function()
      return { "npx", "--quiet", "@fsouza/prettierd" }
    end,

    filetypes = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "eruby.javascript",
    },
  }))
end

function M.root_patterns()
  return { "package.json" }
end

return M

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
      command = "npm",
      args = ("exec --yes --parseable -- eslint_d --stdin --stdin-filename $FILENAME --format json"):split(" "),
    }))

    register(lspnull.builtins.formatting.eslint_d.with({
      command = "npm",
      args = ("exec --yes --parseable -- eslint_d --stdin --stdin-filename $FILENAME --fix-to-stdout"):split(" "),
    }))

    return
  end

  register(lspnull.builtins.formatting.prettierd.with({
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    command = "npm",
    args = ("exec --yes --parseable -- @fsouza/prettierd $FILENAME"):split(" "),
  }))
end

function M.root_patterns()
  return { "package.json" }
end

return M

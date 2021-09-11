local lspconfig_u = require("lspconfig.util")

local lspnull = require("null-ls")
local lspnull_h = require("null-ls.helpers")

local fs = require("fs")
local config_patterns = lspconfig_u.root_pattern("package.json", ".eslintrc.*")

local function use_eslint()
  local path = config_patterns(vim.api.nvim_buf_get_name(0))
  if not path then
    return false
  end

  if path:match("%.eslintrc%..+$") then
    return true
  elseif vim.endswith(path, "package.json") then
    local pkg = string.parse_json(fs.read_file(path))
    if pkg and pkg.eslintConfig then
      return true
    end
  end

  return false
end

return function(register)
  if use_eslint() then
    register(lspnull.builtins.diagnostics.eslint_d.with({
      command = "npm",
      args = vim.split("exec --yes --parseable -- eslint_d --stdin --stdin-filename $FILENAME --format json", " "),
      on_output = function(params)
        local items = params.output and params.output[1].messages or {}
        local parser = lspnull_h.diagnostics.from_json({
          attributes = {
            severity = "severity",
          },
          diagnostic = {
            source = "eslint",
          },
          severities = {
            lspnull_h.diagnostics.severities["warning"],
            lspnull_h.diagnostics.severities["error"],
          },
        })

        return parser({ output = items })
      end,
    }))

    register(lspnull.builtins.formatting.eslint_d.with({
      command = "npm",
      args = vim.split("exec --yes --parseable -- eslint_d --stdin --stdin-filename $FILENAME --fix-to-stdout", " "),
    }))

    return
  end

  register({
    method = lspnull.methods.FORMATTING,
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    generator = lspnull_h.formatter_factory({
      command = "npm",
      args = vim.split("exec --yes --parseable -- @fsouza/prettierd $FILENAME", " "),
      to_stdin = true,
      format = "raw",
    }),
  })
end

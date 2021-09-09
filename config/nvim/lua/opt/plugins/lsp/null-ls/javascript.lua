local lspnull = require("null-ls")
local lspnull_h = require("null-ls.helpers")

local fs = require("fs")
local path = require("path")

local function use_eslint()
  local root_dir = (vim.lsp.buf.list_workspace_folders() or {})[1] or path.cwd()

  local pkg = string.parse_json(fs.read_file(path.join({ root_dir, "package.json" }))) or {}
  if pkg.eslintConfig then
    return true
  end

  local configs = fs.glob(path.join({ root_dir, ".eslintrc.*" }))
  if #configs > 0 then
    return true
  end

  return false
end

return function(register)
  if use_eslint() then
    register({
      lspnull.builtins.diagnostics.eslint_d.with({
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
      }),

      lspnull.builtins.formatting.eslint_d.with({
        command = "npm",
        args = vim.split("exec --yes --parseable -- eslint_d --stdin --stdin-filename $FILENAME --fix-to-stdout", " "),
      }),
    })

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

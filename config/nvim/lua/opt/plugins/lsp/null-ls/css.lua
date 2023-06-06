local lspnull = require("null-ls")

local fs = require("fs")
local path = require("path")

local M = {}

local function use_stylelint()
  local current = vim.api.nvim_buf_get_name(0)
  if current == "" then
    current = path.cwd()
  end

  local config = fs.find_closest(current, { "stylelint.config.*", ".stylelintrc.*" })
  if config then
    return config
  end

  config = fs.find_closest(current, { "package.json" })
  local pkg = string.parse_json(fs.read_file(config))
  if pkg and pkg.stylelint then
    return config
  end

  return nil
end

function M.registration(register)
  if use_stylelint() then
    register(lspnull.builtins.diagnostics.stylelint.with({
      dynamic_command = function()
        return { "npx", "--quiet", "stylelint" }
      end,

      diagnostics_postprocess = function(diagnostic)
        diagnostic.code = diagnostic.message:match("^.*%((.+)%)$")
        diagnostic.message = diagnostic.message:gsub(" %(" .. diagnostic.code:gsub("%-", "%%-") .. "%)", "")
        diagnostic.message = "[" .. diagnostic.code .. "] " .. diagnostic.message
        diagnostic.message = diagnostic.message .. " (" .. diagnostic.source .. ")"
      end,

      extra_filetypes = { "eruby.css" },
    }))

    register(lspnull.builtins.formatting.stylelint.with({
      dynamic_command = function()
        return { "npx", "--quiet", "stylelint" }
      end,

      extra_filetypes = { "eruby.css" },
    }))

    return
  end

  register(lspnull.builtins.formatting.prettierd.with({
    dynamic_command = function()
      return { "npx", "--quiet", "@fsouza/prettierd" }
    end,

    filetypes = { "css", "eruby.css" },
  }))
end

return M

local lspnull = require("null-ls")

require("opt.plugins.lsp.null-ls.json").registration(lspnull.register)
require("opt.plugins.lsp.null-ls.shell").registration(lspnull.register)
require("opt.plugins.lsp.null-ls.lua").registration(lspnull.register)

local sources = require.tree("init.plugins.lsp.null-ls")
local root_patterns = { ".null-ls-root", ".git" }

for _, source in pairs(sources) do
  if type(source) == "table" then
    if type(source.registration) == "function" then
      source.registration(lspnull.register)
    end

    if type(source.root_patterns) == "function" then
      for _, root_pattern in ipairs(source.root_patterns()) do
        table.insert(root_patterns, 1, root_pattern)
      end
    end
  end
end

lspnull.setup({
  diagnostics_format = "[#{c}] #{m} (#{s})",
  root_dir = require("lspconfig.util").root_pattern(root_patterns),
})

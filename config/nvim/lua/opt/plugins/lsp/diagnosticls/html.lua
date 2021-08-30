return function(setup)
  table.insert(setup.filetypes, "html")

  setup.init_options.formatFiletypes.html = "prettier"
  setup.init_options.formatters.prettier = {
    command = "npm",
    args = { "exec", "--yes", "--parseable", "--", "prettier", "--stdin-filepath", "%filepath" },
    rootPatterns = { "package.json", ".git" },
  }
end

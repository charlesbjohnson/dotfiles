return function(setup)
  table.insert(setup.filetypes, "javascript")
  table.insert(setup.filetypes, "typescript")

  table.insert(setup.filetypes, "javascriptreact")
  table.insert(setup.filetypes, "typescriptreact")

  setup.init_options.filetypes.javascript = "eslint"
  setup.init_options.filetypes.typescript = "eslint"

  setup.init_options.filetypes.javascriptreact = "eslint"
  setup.init_options.filetypes.typescriptreact = "eslint"

  setup.init_options.linters.eslint = {
    sourceName = "eslint",

    command      = "npm",
    args         = {"exec", "--yes", "--parseable", "--", "eslint_d", "--format", "json", "--stdin", "--stdin-filename", "%filepath"},
    rootPatterns = {"package.json", ".git"},

    debounce = 100,

    parseJson = {
      errorsRoot = "[0].messages",

      message = "(${ruleId}) ${message}",
      security = "severity",

      line      = "line",
      endline   = "endLine",
      column    = "column",
      endColumn = "endColumn"
    },

    securities = {
      ["1"] = "warning",
      ["2"] = "error"
    }
  }

  setup.init_options.formatFiletypes.javascript = "eslint"
  setup.init_options.formatFiletypes.typescript = "eslint"

  setup.init_options.formatFiletypes.javascriptreact = "eslint"
  setup.init_options.formatFiletypes.typescriptreact = "eslint"

  setup.init_options.formatters.eslint = {
    command      = "sh",
    args         = {"-c", "npm exec --yes --parseable -- eslint_d --stdin --stdin-filename '%filepath' --fix-to-stdout"},
    rootPatterns = {"package.json", ".git"},
  }
end

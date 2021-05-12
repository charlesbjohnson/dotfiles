return function(setup)
  table.insert(setup.filetypes, "css")

  setup.init_options.filetypes.css  = "stylelint"
  setup.init_options.linters.stylelint = {
    sourceName = "stylelint",

    command      = "npx",
    args         = {"stylelint", "--formatter", "json", "--stdin", "--stdin-filename", "%filepath"},
    rootPatterns = {"package.json", ".git"},

    debounce = 100,

    parseJson = {
      errorsRoot = "[0].warnings",

      message  = "${text}",
      security = "severity",

      line   = "line",
      column = "column"
    },

    securities = {
      error   = "error",
      warning = "warning"
    }
  }

  setup.init_options.formatFiletypes.css = "stylelint"
  setup.init_options.formatters.stylelint = {
    command      = "npx",
    args         = {"stylelint", "--fix", "--stdin", "--stdin-filename", "%filepath"},
    rootPatterns = {"package.json", ".git"}
  }
end

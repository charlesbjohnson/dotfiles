return function(setup)
  table.insert(setup.filetypes, "javascript")

  setup.init_options.filetypes.javascript = "xo"
  setup.init_options.linters.xo = {
    sourceName = "xo",

    command      = "npx",
    args         = {"xo", "--reporter", "json", "--stdin", "--stdin-filename", "%filepath"},
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

  setup.init_options.formatFiletypes.javascript = "xo"
  setup.init_options.formatters.xo = {
    command      = "npx",
    args         = {"xo", "--fix", "--stdin", "--stdin-filename", "%filepath"},
    rootPatterns = {"package.json", ".git"},
  }
end

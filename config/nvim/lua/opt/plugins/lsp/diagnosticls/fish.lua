return function(setup)
  table.insert(setup.filetypes, "fish")

  setup.init_options.filetypes.fish = "fish"
  setup.init_options.linters.fish = {
    sourceName = "fish",

    command = "fish",
    args = { "--no-execute", "%file" },

    debounce = 100,
    isStdout = false,
    isStderr = true,

    formatLines = 1,
    formatPattern = {
      [[^.*\(line (\d+)\): (.*)$]],
      {
        line = 1,
        message = 2,
      },
    },
  }

  setup.init_options.formatFiletypes.fish = "fish_indent"
  setup.init_options.formatters.fish_indent = {
    command = "fish_indent",
  }
end

local lspnull = require("null-ls")
local lspnull_h = require("null-ls.helpers")

return function(register)
  register({
    method = lspnull.methods.DIAGNOSTICS,
    filetypes = { "yaml" },
    generator = lspnull_h.generator_factory({
      command = "yamllint",
      args = ("--strict --format parsable -"):split(" "),

      to_stdin = true,
      check_exit_code = { 0, 1, 2 },

      format = "line",
      on_output = lspnull_h.diagnostics.from_pattern(
        [=[^.*:(%d+):(%d+): %[([^]]+)%] (.-) %(([^)]+)%)$]=],
        { "row", "col", "severity", "message", "code" }
      ),
    }),
  })

  register({
    method = lspnull.methods.FORMATTING,
    filetypes = { "yaml" },
    generator = lspnull_h.formatter_factory({
      command = "npm",
      args = ("exec --yes --parseable -- @fsouza/prettierd $FILENAME"):split(" "),
      to_stdin = true,
      format = "raw",
    }),
  })
end

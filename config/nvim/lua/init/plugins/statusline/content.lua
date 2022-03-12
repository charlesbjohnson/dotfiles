return function(options)
  vim.list_extend(options.force_inactive.filetypes, {
    "NvimTree",
    "packer",
    "alpha",
  })

  local active = options.components.active

  active[1][1] = {
    icon = "",
    provider = "vi_mode",
  }

  active[1][2] = {
    icon = " ",
    provider = "git_branch",
    enabled = function()
      return require("feline.providers.git").git_branch() ~= ""
    end,
  }

  active[1][3] = {
    icon = "+",
    provider = "git_diff_added",
    enabled = function()
      return require("feline.providers.git").git_diff_added() ~= ""
    end,
  }

  active[1][4] = {
    icon = "~",
    provider = "git_diff_changed",
    enabled = function()
      return require("feline.providers.git").git_diff_changed() ~= ""
    end,
  }

  active[1][5] = {
    icon = "-",
    provider = "git_diff_removed",
    enabled = function()
      return require("feline.providers.git").git_diff_removed() ~= ""
    end,
  }

  active[3][1] = {
    icon = " ",
    provider = "diagnostic_errors",
    enabled = function()
      return require("feline.providers.lsp").diagnostics_exist("Error")
    end,
  }

  active[3][2] = {
    icon = " ",
    provider = "diagnostic_warnings",
    enabled = function()
      return require("feline.providers.lsp").diagnostics_exist("Warn")
    end,
  }

  active[3][3] = {
    icon = " ",
    provider = "diagnostic_hints",
    enabled = function()
      return require("feline.providers.lsp").diagnostics_exist("Hint")
    end,
  }

  active[3][4] = {
    icon = " ",
    provider = "diagnostic_info",
    enabled = function()
      return require("feline.providers.lsp").diagnostics_exist("Info")
    end,
  }

  active[3][5] = {
    provider = "file_encoding",
  }

  active[3][6] = {
    provider = "file_format",
  }

  active[3][7] = {
    provider = {
      name = "file_type",
      opts = {
        colored_icon = false,
        filetype_icon = true,
      },
    },
  }

  active[3][8] = {
    provider = "position",
  }
end

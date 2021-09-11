local file_formats = {
  unix = "LF",
  dos = "CRLF",
  mac = "CR",
}

return function(options)
  vim.list_extend(options.force_inactive.filetypes, {
    "NvimTree",
    "minimap",
    "packer",
    "startify",
  })

  local active = options.components.active
  local inactive = options.components.inactive

  active[1][1] = {
    icon = "",
    provider = "vi_mode",
  }

  active[1][2] = {
    icon = " ",
    provider = "git_branch",
    enabled = function()
      return require("feline.providers.git").git_branch({}) ~= ""
    end,
  }

  active[1][3] = {
    icon = "+",
    provider = "git_diff_added",
    enabled = function()
      return require("feline.providers.git").git_diff_added({}) ~= ""
    end,
  }

  active[1][4] = {
    icon = "~",
    provider = "git_diff_changed",
    enabled = function()
      return require("feline.providers.git").git_diff_changed({}) ~= ""
    end,
  }

  active[1][5] = {
    icon = "-",
    provider = "git_diff_removed",
    enabled = function()
      return require("feline.providers.git").git_diff_removed({}) ~= ""
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
      return require("feline.providers.lsp").diagnostics_exist("Warning")
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
      return require("feline.providers.lsp").diagnostics_exist("Information")
    end,
  }

  active[3][5] = {
    provider = "file_encoding",
  }

  active[3][6] = {
    provider = function()
      return file_formats[vim.bo.fileformat]
    end,
  }

  active[3][7] = {
    provider = function()
      local file_type = require("feline.providers.file").file_type()
      return file_type ~= "" and file_type or "TEXT"
    end,
  }

  active[3][8] = {
    provider = "position",
  }

  inactive[1] = vim.tbl_deep_extend("force", {}, active[1])
  for _, v in ipairs(inactive[1]) do
    v.enabled = false
  end

  inactive[2] = vim.tbl_deep_extend("force", {}, active[2])
  for _, v in ipairs(inactive[2]) do
    v.enabled = false
  end

  inactive[3] = vim.tbl_deep_extend("force", {}, active[3])
  for _, v in ipairs(inactive[3]) do
    v.enabled = false
  end
end

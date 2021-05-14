local file_formats = {
  unix = "LF",
  dos  = "CRLF",
  mac  = "CR"
}

return function(options)
  vim.list_extend(options.properties.force_inactive.filetypes, {
    "minimap",
    "packer",
    "startify"
  })

  local left = options.components.left
  local right = options.components.right

  left.active[1] = {
    icon     = "",
    provider = "vi_mode",
  }

  left.active[2] = {
    provider = "",
    enabled = function()
      return not left.active[3].enabled()
    end
  }

  left.active[3] = {
    icon     = " ",
    provider = "git_branch",
    enabled  = function()
      return require("feline.providers.git").git_branch({}) ~= ""
    end
  }

  left.active[4] = {
    provider = "",
    enabled = function()
      return not left.active[5].enabled() and not left.active[6].enabled() and not left.active[7].enabled()
    end
  }

  left.active[5] = {
    icon     = "+",
    provider = "git_diff_added",
    enabled  = function()
      return require("feline.providers.git").git_diff_added({}) ~= ""
    end
  }

  left.active[6] = {
    icon     = "~",
    provider = "git_diff_changed",
    enabled  = function()
      return require("feline.providers.git").git_diff_changed({}) ~= ""
    end
  }

  left.active[7] = {
    icon     = "-",
    provider = "git_diff_removed",
    enabled  = function()
      return require("feline.providers.git").git_diff_removed({}) ~= ""
    end
  }

  right.active[1] = {
    icon = " ",
    provider = "diagnostic_errors",
    enabled  = function()
      return require("feline.providers.lsp").diagnostics_exist("Error")
    end
  }

  right.active[2] = {
    icon = " ",
    provider = "diagnostic_warnings",
    enabled  = function()
      return require("feline.providers.lsp").diagnostics_exist("Warning")
    end
  }

  right.active[3] = {
    icon = " ",
    provider = "diagnostic_hints",
    enabled  = function()
      return require("feline.providers.lsp").diagnostics_exist("Hint")
    end
  }

  right.active[4] = {
    icon = " ",
    provider = "diagnostic_info",
    enabled  = function()
      return require("feline.providers.lsp").diagnostics_exist("Information")
    end
  }

  right.active[5] = {
    provider = "file_encoding"
  }

  right.active[6] = {
    provider = function()
      return file_formats[vim.bo.fileformat]
    end
  }

  right.active[7] = {
    provider = function()
      local file_type = require("feline.providers.file").file_type()
      return file_type ~= "" and file_type or "TEXT"
    end
  }

  right.active[8] = {
    provider = "position"
  }

  left.inactive = vim.tbl_deep_extend("force", {}, left.active)
  for _, v in ipairs(left.inactive) do
    v.enabled = false
  end

  right.inactive = vim.tbl_deep_extend("force", {}, right.active)
  for _, v in ipairs(right.inactive) do
    v.enabled = false
  end
end

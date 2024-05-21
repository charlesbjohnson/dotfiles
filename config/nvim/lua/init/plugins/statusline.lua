local colors = require("colors")

local statuscolumn = {
  theme = colors,

  disable = {
    filetypes = {},
    buftypes = {},
    bufnames = {},
  },

  force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {},
  },

  conditional_components = {
    active = {},
    inactive = {},
  },

  components = {
    active = {},
    inactive = {},
  },
}

local statusline = {
  theme = colors,

  vi_mode_colors = {
    NORMAL = colors[8],
    OP = colors[6],
    INSERT = colors[14],
    VISUAL = colors[13],
    BLOCK = colors[13],
    REPLACE = colors[11],
    ["V-REPLACE"] = colors[11],
    ENTER = colors[6],
    MORE = colors[6],
    SELECT = colors[6],
    COMMAND = colors[6],
    SHELL = colors[6],
    TERM = colors[6],
    NONE = colors[6],
  },

  disable = {
    filetypes = {},
    buftypes = {},
    bufnames = {},
  },

  force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {},
  },

  conditional_components = {
    active = {},
    inactive = {},
  },

  components = {
    active = {},
    inactive = {},
  },
}

local winbar = {
  theme = colors,

  disable = {
    filetypes = {},
    buftypes = {},
    bufnames = {},
  },

  force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {},
  },

  conditional_components = {
    active = {},
    inactive = {},
  },

  components = {
    active = {},
    inactive = {},
  },
}

for _ = 1, 3 do
  table.insert(statusline.components.active, {})
  table.insert(statusline.components.inactive, {})
end

require("init.plugins.statusline.content")(statusline)
require("init.plugins.statusline.style")(statusline)

require("init.plugins.statusline.statuscolumn.content")(statuscolumn)
require("init.plugins.statusline.statuscolumn.style")(statuscolumn)

require("init.plugins.statusline.winbar.content")(winbar)
require("init.plugins.statusline.winbar.style")(winbar)

-- freddiehaddad/feline.nvim
require("feline").setup(statusline)
require("feline").statuscolumn.setup(statuscolumn)
require("feline").winbar.setup(winbar)

vim.opt.winbar = ""
vim.opt.statuscolumn = ""

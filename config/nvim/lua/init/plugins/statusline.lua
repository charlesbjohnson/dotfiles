local colors = require("colors")

local options = {
  default_fg = colors.fg,
  default_bg = colors.bg,

  colors = colors,

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
}

options.properties = {
  force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {},
  },
}

options.components = {
  left = {},
  mid = {},
  right = {},
}

for _, v in pairs(options.components) do
  v.active = {}
  v.inactive = v.active
end

require("init.plugins.statusline.content")(options)
require("init.plugins.statusline.style")(options)

require("feline").setup(options)

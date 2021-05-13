local colors = require("colors.nord")

local options = {
  default_fg = colors.colors.fg,
  default_bg = colors.colors.bg,

  colors = colors.colors,

  vi_mode_colors = {
    NORMAL        = colors.colors[8],
    OP            = colors.colors[6],
    INSERT        = colors.colors[14],
    VISUAL        = colors.colors[13],
    BLOCK         = colors.colors[13],
    REPLACE       = colors.colors[11],
    ["V-REPLACE"] = colors.colors[11],
    ENTER         = colors.colors[6],
    MORE          = colors.colors[6],
    SELECT        = colors.colors[6],
    COMMAND       = colors.colors[6],
    SHELL         = colors.colors[6],
    TERM          = colors.colors[6],
    NONE          = colors.colors[6]
  }
}

options.properties = {
  force_inactive = {
    filetypes = {},
    buftypes  = {},
    bufnames  = {}
  }
}

options.components = {
  left  = {},
  mid   = {},
  right = {}
}

for _, v in pairs(options.components) do
  v.active = {}
  v.inactive = v.active
end

require("init.plugins.statusline.content")(options)
require("init.plugins.statusline.style")(options)

require("feline").setup(options)

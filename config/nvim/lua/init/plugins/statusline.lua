local colors = require("colors")

local options = {
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

options.force_inactive = {
  filetypes = {},
  buftypes = {},
  bufnames = {},
}

options.components = {
  active = {},
  inactive = {},
}

for i = 1, 3 do
  table.insert(options.components.active, {})
  table.insert(options.components.inactive, options.components.active[i])
end

require("init.plugins.statusline.content")(options)
require("init.plugins.statusline.style")(options)

require("feline").setup(options)

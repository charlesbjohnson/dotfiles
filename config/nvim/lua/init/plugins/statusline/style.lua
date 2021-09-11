local colors = require("colors")

local function vi_mode_bg_color()
  return require("feline.providers.vi_mode").get_mode_color()
end

local function vi_mode_fg_color()
  return colors.complement(vi_mode_bg_color())
end

return function(options)
  local active = options.components.active

  active[1][1].hl = function()
    return {
      bg = vi_mode_bg_color(),
      fg = vi_mode_fg_color(),
      style = "bold",
    }
  end
  active[1][1].left_sep = function()
    return { str = " ", hl = { bg = vi_mode_bg_color() } }
  end
  active[1][1].right_sep = function()
    return { str = "█", hl = { fg = vi_mode_bg_color(), bg = active[1][2].enabled() and 3 or 1 } }
  end

  active[1][2].hl = { bg = 3 }
  active[1][2].left_sep = { str = " ", hl = { bg = 3 } }
  active[1][2].right_sep = { str = "█", hl = { fg = 3 } }

  active[1][3].hl = { fg = 14, style = "bold" }
  active[1][3].left_sep = " "

  active[1][4].hl = { fg = 13, style = "bold" }
  active[1][4].left_sep = " "

  active[1][5].hl = { fg = 11, style = "bold" }
  active[1][5].left_sep = " "
  active[1][5].right_sep = " "

  active[3][1].hl = { fg = 11 }
  active[3][1].right_sep = " "

  active[3][2].hl = { fg = 13 }
  active[3][2].right_sep = " "

  active[3][3].hl = { fg = 9 }
  active[3][3].right_sep = " "

  active[3][4].hl = { fg = 7 }
  active[3][4].right_sep = " "

  active[3][5].hl = { bg = 3 }
  active[3][5].left_sep = { str = "█", hl = { fg = 3 } }

  active[3][6].hl = { bg = 3 }
  active[3][6].left_sep = { str = " ", hl = { bg = 3 } }

  active[3][7].hl = { bg = 3 }
  active[3][7].left_sep = { str = " ", hl = { bg = 3 } }
  active[3][7].right_sep = { str = " ", hl = { bg = 3 } }

  active[3][8].hl = active[1][1].hl
  active[3][8].left_sep = function()
    return { str = "█", hl = { fg = vi_mode_bg_color(), bg = 3 } }
  end
  active[3][8].right_sep = active[1][1].left_sep
end

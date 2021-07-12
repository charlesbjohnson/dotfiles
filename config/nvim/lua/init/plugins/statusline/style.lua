local colors = require("colors")

local vi_mode = {}

function vi_mode.bg_color()
  return require("feline.providers.vi_mode").get_mode_color()
end

function vi_mode.fg_color(self)
  return colors.complement(self.bg_color())
end

return function(options)
  local left = options.components.left
  local right = options.components.right

  left.active[1].hl = function()
    return {
      bg    = vi_mode:bg_color(),
      fg    = vi_mode:fg_color(),
      style = "bold"
    }
  end
  left.active[1].left_sep = function()
    return {str = " ", hl = {bg = vi_mode:bg_color()}}
  end
  left.active[1].right_sep = function()
    return {str = "█", hl = {fg = vi_mode:bg_color(), bg = left.active[2].enabled() and 1 or 3}}
  end

  left.active[3].hl        = {bg = 3}
  left.active[3].left_sep  = {str = " ", hl = {bg = 3}}
  left.active[3].right_sep = {str = "█", hl = {fg = 3}}

  left.active[5].hl       = {fg = 14, style = "bold"}
  left.active[5].left_sep = " "

  left.active[6].hl       = {fg = 13, style = "bold"}
  left.active[6].left_sep = " "

  left.active[7].hl        = {fg = 11, style = "bold"}
  left.active[7].left_sep  = " "
  left.active[7].right_sep = " "

  right.active[1].hl        = {fg = 11}
  right.active[1].right_sep = " "

  right.active[2].hl        = {fg = 13}
  right.active[2].right_sep = " "

  right.active[3].hl        = {fg = 9}
  right.active[3].right_sep = " "

  right.active[4].hl        = {fg = 7}
  right.active[4].right_sep = " "

  right.active[5].hl       = {bg = 3}
  right.active[5].left_sep = {str = "█", hl = {fg = 3}}

  right.active[6].hl       = {bg = 3}
  right.active[6].left_sep = {str = " ", hl = {bg = 3}}

  right.active[7].hl        = {bg = 3}
  right.active[7].left_sep  = {str = " ", hl = {bg = 3}}
  right.active[7].right_sep = {str = " ", hl = {bg = 3}}

  right.active[8].hl        = left.active[1].hl
  right.active[8].left_sep  = function()
    return {str = "█", hl = {fg = vi_mode:bg_color(), bg = 3}}
  end
  right.active[8].right_sep = left.active[1].left_sep
end

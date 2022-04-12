local nord = require("nordic.palette")

local colors = {
  [0] = nord.dark_black,
  [1] = nord.black,
  [2] = nord.bright_black,
  [3] = nord.gray,
  [4] = nord.dark_white,
  [5] = nord.white,
  [6] = nord.bright_white,
  [7] = nord.cyan,
  [8] = nord.bright_cyan,
  [9] = nord.blue,
  [10] = nord.intense_blue,
  [11] = nord.red,
  [12] = nord.orange,
  [13] = nord.yellow,
  [14] = nord.green,
  [15] = nord.purple,
}

colors.bg = colors[1]
colors.fg = colors[4]

local complements = {
  [0] = colors[6],
  [1] = colors[6],
  [2] = colors[6],
  [3] = colors[6],
  [4] = colors[3],
  [5] = colors[3],
  [6] = colors[3],
  [7] = colors[3],
  [8] = colors[3],
  [9] = colors[3],
  [10] = colors[3],
  [11] = colors[6],
  [12] = colors[3],
  [13] = colors[3],
  [14] = colors[3],
  [15] = colors[6],
}

complements.bg = colors.fg
complements.fg = colors.bg

local inverted_colors = {}
for k, v in pairs(colors) do
  if k ~= "fg" and k ~= "bg" then
    inverted_colors[v] = k
  end
end

local M = colors

function M.complement(color)
  return complements[inverted_colors[color]]
end

return M

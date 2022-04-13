local nord = require("nord.colors")

local colors = {
  [0] = nord.nord0_gui,
  [1] = nord.nord1_gui,
  [2] = nord.nord2_gui,
  [3] = nord.nord3_gui,
  [4] = nord.nord4_gui,
  [5] = nord.nord5_gui,
  [6] = nord.nord6_gui,
  [7] = nord.nord7_gui,
  [8] = nord.nord8_gui,
  [9] = nord.nord9_gui,
  [10] = nord.nord10_gui,
  [11] = nord.nord11_gui,
  [12] = nord.nord12_gui,
  [13] = nord.nord13_gui,
  [14] = nord.nord14_gui,
  [15] = nord.nord15_gui,
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

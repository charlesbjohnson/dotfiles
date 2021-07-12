local colors = {
  [0]  = "#2E3440",
  [1]  = "#3B4252",
  [2]  = "#434C5E",
  [3]  = "#4C566A",
  [4]  = "#D8DEE9",
  [5]  = "#E5E9F0",
  [6]  = "#ECEFF4",
  [7]  = "#8FBCBB",
  [8]  = "#88C0D0",
  [9]  = "#81A1C1",
  [10] = "#5E81AC",
  [11] = "#BF616A",
  [12] = "#D08770",
  [13] = "#EBCB8B",
  [14] = "#A3BE8C",
  [15] = "#B48EAD"
}

colors.bg = colors[1]
colors.fg = colors[4]

local complements = {
  [0]  = colors[6],
  [1]  = colors[6],
  [2]  = colors[6],
  [3]  = colors[6],
  [4]  = colors[3],
  [5]  = colors[3],
  [6]  = colors[3],
  [7]  = colors[3],
  [8]  = colors[3],
  [9]  = colors[3],
  [10] = colors[3],
  [11] = colors[6],
  [12] = colors[3],
  [13] = colors[3],
  [14] = colors[3],
  [15] = colors[6]
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

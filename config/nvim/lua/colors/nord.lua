local M = {}

M.colors = {
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

M.colors.bg = M.colors[1]
M.colors.fg = M.colors[4]

M.complements = {
  [0]  = M.colors[6],
  [1]  = M.colors[6],
  [2]  = M.colors[6],
  [3]  = M.colors[6],
  [4]  = M.colors[3],
  [5]  = M.colors[3],
  [6]  = M.colors[3],
  [7]  = M.colors[3],
  [8]  = M.colors[3],
  [9]  = M.colors[3],
  [10] = M.colors[3],
  [11] = M.colors[6],
  [12] = M.colors[3],
  [13] = M.colors[3],
  [14] = M.colors[3],
  [15] = M.colors[6]
}

M.complements.bg = M.colors.fg
M.complements.fg = M.colors.bg

local inverted_colors = {}
for k, v in pairs(M.colors) do
  if k ~= "fg" and k ~= "bg" then
    inverted_colors[v] = k
  end
end

function M.complement(color)
  return M.complements[inverted_colors[color]]
end

return M

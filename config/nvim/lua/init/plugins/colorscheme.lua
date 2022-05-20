local colors = require("colors")

-- shaunsingh/nord.nvim
vim.g.nord_borders = true
vim.g.nord_contrast = true
vim.g.nord_italic = false

require("nord").set()

-- TODO: submit fix for yellow
vim.api.nvim_set_hl(0, "BufferCurrentMod", { fg = colors[13] })
vim.api.nvim_set_hl(0, "BufferInactiveMod", { fg = colors[13] })
vim.api.nvim_set_hl(0, "BufferVisibleMod", { fg = colors[13] })

vim.api.nvim_set_hl(0, "DiffChange", { fg = colors[13] })
vim.api.nvim_set_hl(0, "diffChanged", { fg = colors[13] })

vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors[13] })
vim.api.nvim_set_hl(0, "GitSignsChangeLn", { fg = colors[13] })
vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = colors[13] })

vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultWarning", { fg = colors[13] })
vim.api.nvim_set_hl(0, "LspDiagnosticsFloatingWarning", { fg = colors[13] })
vim.api.nvim_set_hl(0, "LspDiagnosticsSignWarning", { fg = colors[13] })
vim.api.nvim_set_hl(0, "LspDiagnosticsUnderlineWarning", { sp = colors[13] })
vim.api.nvim_set_hl(0, "LspDiagnosticsVirtualTextWarning", { fg = colors[13] })

vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = colors[13] })

vim.api.nvim_set_hl(0, "WarningMsg", { fg = colors[13] })
vim.api.nvim_set_hl(0, "Warnings", { fg = colors[13] })

vim.api.nvim_set_hl(0, "healthWarning", { fg = colors[13] })

local ext = require("ext")
require = ext.require

--- General
vim.g.mapleader = " "

vim.opt.clipboard = { "unnamedplus" }
vim.opt.hidden = true
vim.opt.shell = vim.fn.system("which bash"):trim() .. " --login"
vim.opt.shellcmdflag = "-lc"
vim.opt.showmatch = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 300
vim.opt.wildmode = vim.opt.wildmode ^ { "longest:full" }

--- Appearance
vim.opt.cmdheight = 1
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.cursorline = true
vim.opt.foldlevel = 99
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars = { eol = "↵", tab = "⇥ ", trail = "·" }
vim.opt.number = true
vim.opt.scrolloff = 20
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.wrap = false

--- Tabbing
vim.opt.cindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

--- Search & History
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.smartcase = true

--- Key bindings
vim.keymap.set("n", "<Leader>q", "<Cmd>quit<CR>")
vim.keymap.set("n", "<Leader>w", "<Cmd>write<CR>")

-- No confusing window
vim.keymap.set("", "q:", "<NOP>")

-- No Ex mode
vim.keymap.set("", "Q", "<NOP>")

-- No help window
vim.keymap.set("", "<F1>", "<Esc>")
vim.keymap.set("i", "<F1>", "<Esc>")

-- Quickly clear highlighted search
vim.keymap.set("n", "<Leader><Leader>", ":nohlsearch<CR>", { silent = true })

-- Consistent indent/unindent across all modes
vim.keymap.set("n", "<C-d>", "<<")
vim.keymap.set("n", "<C-t>", ">>")
vim.keymap.set("x", "<C-d>", "<gv")
vim.keymap.set("x", "<C-t>", ">gv")

-- Move around more quickly
vim.keymap.set("n", "<C-b>", "<NOP>")
vim.keymap.set("x", "<C-b>", "<NOP>")

vim.keymap.set("n", "<C-f>", "<NOP>")
vim.keymap.set("x", "<C-f>", "<NOP>")

vim.keymap.set("n", "<C-n>", "<NOP>")
vim.keymap.set("x", "<C-n>", "<NOP>")

vim.keymap.set("n", "<C-u>", "<NOP>")
vim.keymap.set("x", "<C-u>", "<NOP>")

vim.keymap.set("n", "<M-k>", "{")
vim.keymap.set("x", "<M-k>", "{")
vim.keymap.set("n", "<M-j>", "}")
vim.keymap.set("x", "<M-j>", "}")
vim.keymap.set("n", "<M-h>", "0")
vim.keymap.set("x", "<M-h>", "0")
vim.keymap.set("n", "<M-l>", "$")
vim.keymap.set("x", "<M-l>", "$")

-- Splits
vim.keymap.set("n", "<C-w>|", "<Cmd>vsplit<CR>", { silent = true })
vim.keymap.set("n", "<C-w>_", "<Cmd>split<CR>", { silent = true })

vim.keymap.set("n", "<C-w><C-h>", "<C-w>H", { silent = true })
vim.keymap.set("n", "<C-w><C-j>", "<C-w>J", { silent = true })
vim.keymap.set("n", "<C-w><C-k>", "<C-w>K", { silent = true })
vim.keymap.set("n", "<C-w><C-l>", "<C-w>L", { silent = true })

vim.keymap.set("n", "<C-w>H", "<Cmd>vertical resize +5<CR>", { silent = true })
vim.keymap.set("n", "<C-w>J", "<Cmd>resize -5<CR>", { silent = true })
vim.keymap.set("n", "<C-w>K", "<Cmd>resize +5<CR>", { silent = true })
vim.keymap.set("n", "<C-w>L", "<Cmd>vertical resize -5<CR>", { silent = true })

-- Ctag navigation
vim.keymap.set("n", "<Leader>[", "<Cmd>pop<CR>", { silent = true })
vim.keymap.set("n", "<Leader>]", "<C-]>")

-- Automatically jump to end of pasted text
vim.keymap.set("n", "p", "p`]", { silent = true })
vim.keymap.set("x", "p", "p`]", { silent = true })
vim.keymap.set("x", "y", "y`]", { silent = true })

-- LSP
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })

vim.keymap.set("n", "<Leader>c", vim.lsp.buf.code_action, { silent = true })
vim.keymap.set("n", "<Leader>f", vim.lsp.buf.formatting, { silent = true })
vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, { silent = true })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = true })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { silent = true })
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { silent = true })

vim.keymap.set("n", "gr", vim.lsp.buf.references, { silent = true })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true })

-- Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")

--- Plugins
require("plugins")

--- Overrides
require("init.plugins")
require.tree("init")

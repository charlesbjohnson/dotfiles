local ext = require("ext")
require = ext.require

vim.map  = ext.vim.mapping("")
vim.imap = ext.vim.mapping("i")
vim.nmap = ext.vim.mapping("n")
vim.omap = ext.vim.mapping("o")
vim.smap = ext.vim.mapping("s")
vim.tmap = ext.vim.mapping("t")
vim.vmap = ext.vim.mapping("v")
vim.xmap = ext.vim.mapping("x")

vim.hl      = ext.vim.highlight
vim.hl_link = ext.vim.highlight_link

--- General
vim.g.mapleader = " "

vim.opt.clipboard    = {"unnamedplus"}
vim.opt.hidden       = true
vim.opt.shell        = vim.fn.system("which bash"):trim() .. " --login"
vim.opt.shellcmdflag = "-lc"
vim.opt.showmatch    = true
vim.opt.splitbelow   = true
vim.opt.splitright   = true
vim.opt.updatetime   = 300
vim.opt.wildmode     = vim.opt.wildmode ^ {"longest:full"}

vim.cmd("syntax on")

--- Appearance
vim.opt.cmdheight     = 1
vim.opt.colorcolumn   = {0} -- https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.opt.completeopt   = {"menuone", "noselect"}
vim.opt.list          = true
vim.opt.listchars     = {eol = "↵", tab = "⇥ ", trail = "·"}
vim.opt.number        = true
vim.opt.scrolloff     = 20
vim.opt.shortmess     = vim.opt.shortmess + {c = true}
vim.opt.showmode      = false
vim.opt.showtabline   = 2
vim.opt.signcolumn    = "yes"
vim.opt.termguicolors = true
vim.opt.wrap          = false

--- Tabbing
vim.opt.cindent     = true
vim.opt.expandtab   = true
vim.opt.shiftwidth  = 2
vim.opt.softtabstop = 2
vim.opt.tabstop     = 2

--- Search & History
vim.opt.ignorecase  = true
vim.opt.inccommand  = "nosplit"
vim.opt.swapfile    = false
vim.opt.writebackup = false
vim.opt.smartcase   = true

--- Key bindings
vim.nmap("<Leader>q", "<Cmd>quit<CR>")
vim.nmap("<Leader>w", "<Cmd>write<CR>")

-- No confusing window
vim.map("q:", "<NOP>")

-- No Ex mode
vim.map("Q", "<NOP>")

-- No help window
vim.map("<F1>",  "<Esc>")
vim.imap("<F1>", "<Esc>")

-- Quickly clear highlighted search
vim.nmap("<Leader><Leader>", "<Cmd>nohlsearch<CR>", {silent = true})

-- Consistent indent/unindent across all modes
vim.nmap("<C-d>", "<<")
vim.nmap("<C-t>", ">>")
vim.xmap("<C-d>", "<gv")
vim.xmap("<C-t>", ">gv")

-- Move around more quickly
vim.nmap("<C-b>", "<NOP>")
vim.xmap("<C-b>", "<NOP>")

vim.nmap("<C-f>", "<NOP>")
vim.xmap("<C-f>", "<NOP>")

vim.nmap("<C-n>", "<NOP>")
vim.xmap("<C-n>", "<NOP>")

vim.nmap("<C-u>", "<NOP>")
vim.xmap("<C-u>", "<NOP>")

vim.nmap("<M-k>", "{")
vim.xmap("<M-k>", "{")
vim.nmap("<M-j>", "}")
vim.xmap("<M-j>", "}")
vim.nmap("<M-h>", "0")
vim.xmap("<M-h>", "0")
vim.nmap("<M-l>", "$")
vim.xmap("<M-l>", "$")

-- Splits
vim.nmap("<C-w>|", "<Cmd>vsplit<CR>", { silent = true})
vim.nmap("<C-w>_", "<Cmd>split<CR>",  { silent = true})

vim.nmap("<C-w><C-h>", "<C-w>H", {silent = true})
vim.nmap("<C-w><C-j>", "<C-w>J", {silent = true})
vim.nmap("<C-w><C-k>", "<C-w>K", {silent = true})
vim.nmap("<C-w><C-l>", "<C-w>L", {silent = true})

vim.nmap("<C-w>H", "<Cmd>vertical resize +5<CR>", {silent = true})
vim.nmap("<C-w>J", "<Cmd>resize -5<CR>",          {silent = true})
vim.nmap("<C-w>K", "<Cmd>resize +5<CR>",          {silent = true})
vim.nmap("<C-w>L", "<Cmd>vertical resize -5<CR>", {silent = true})

-- Ctag navigation
vim.nmap("<Leader>[", "<Cmd>pop<CR>", {silent = true})
vim.nmap("<Leader>]", "<C-]>")

-- Automatically jump to end of pasted text
vim.nmap("p", "p`]", {silent = true})
vim.xmap("p", "p`]", {silent = true})
vim.xmap("y", "y`]", {silent = true})

-- LSP
vim.fn.sign_define("LspDiagnosticsSignError",       {text = "", texthl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignHint",        {text = "", texthl = "LspDiagnosticsSignHint"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", texthl = "LspDiagnosticsSignInformation"})
vim.fn.sign_define("LspDiagnosticsSignWarning",     {text = "", texthl = "LspDiagnosticsSignWarning"})

vim.nmap("gd", "<Cmd>lua vim.lsp.buf.definition()<CR>",     {silent = true})
vim.nmap("gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>",    {silent = true})
vim.nmap("gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", {silent = true})
vim.nmap("gr", "<Cmd>lua vim.lsp.buf.references()<CR>",     {silent = true})
vim.nmap("F",  "<Cmd>lua vim.lsp.buf.formatting()<CR>",     {silent = true})
vim.nmap("K",  "<Cmd>lua vim.lsp.buf.hover()<CR>",          {silent = true})

-- Terminal
vim.tmap("<Esc>", "<C-\\><C-n>")

vim.tmap("<C-h>", "<C-\\><C-n><C-w>h")
vim.tmap("<C-j>", "<C-\\><C-n><C-w>j")
vim.tmap("<C-k>", "<C-\\><C-n><C-w>k")
vim.tmap("<C-l>", "<C-\\><C-n><C-w>l")

--- Plugins
require("plugins")

--- Overrides
require("init.plugins")
require.tree("init")

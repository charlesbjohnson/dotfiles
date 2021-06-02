local ext = require("ext")

require = ext.require
vim     = _G.vim

vim.__o  = vim.o
vim.__wo = vim.wo
vim.__bo = vim.bo

vim.o  = ext.vim.option("o")
vim.wo = ext.vim.option("wo")
vim.bo = ext.vim.option("bo")

vim.map  = ext.vim.mapping("")
vim.imap = ext.vim.mapping("i")
vim.nmap = ext.vim.mapping("n")
vim.omap = ext.vim.mapping("o")
vim.smap = ext.vim.mapping("s")
vim.vmap = ext.vim.mapping("v")
vim.xmap = ext.vim.mapping("x")

vim.hl      = ext.vim.highlight
vim.hl_link = ext.vim.highlight_link

--- General
vim.g.mapleader    = " "
vim.o.clipboard    = "unnamedplus"
vim.o.hidden       = true
vim.o.shell        = vim.fn.system("which bash"):trim()
vim.o.shellcmdflag = "-lc"
vim.o.showmatch    = true
vim.o.splitbelow   = true
vim.o.splitright   = true
vim.o.updatetime   = 300
vim.o.viminfo      = "'100,n$HOME/.local/share/nvim/files/info/nviminfo"
vim.o.visualbell   = true
vim.o.wildmode     = "longest:full,full"

vim.cmd("syntax on")

--- Appearance
vim.o.cmdheight     = 2
vim.wo.colorcolumn  = "80"
vim.o.completeopt   = "menuone,noselect"
vim.wo.cursorline   = true
vim.wo.list         = true
vim.wo.listchars    = "tab:⇥ ,eol:↵,trail:·"
vim.o.showmode      = false
vim.wo.wrap         = false
vim.wo.number       = true
vim.wo.scrolloff    = 20
vim.o.shortmess     = vim.o.shortmess .. "c"
vim.o.showtabline   = 2
vim.wo.signcolumn   = "yes"
vim.o.termguicolors = true

--- Tabbing
vim.bo.cindent     = true
vim.bo.expandtab   = true
vim.bo.shiftwidth  = 2
vim.bo.softtabstop = 2
vim.bo.tabstop     = 2

--- Search & History
vim.o.ignorecase  = true
vim.o.inccommand  = "nosplit"
vim.bo.swapfile   = false
vim.o.writebackup = false
vim.o.smartcase   = true

--- Key bindings
vim.nmap("<Leader>q", ":q<CR>")
vim.nmap("<Leader>w", ":w<CR>")

-- No confusing window
vim.map("q:", "<NOP>")

-- No Ex mode
vim.map("Q", "<NOP>")

-- No help window
vim.map("<F1>",  "<Esc>")
vim.imap("<F1>", "<Esc>")

-- Quickly clear highlighted search
vim.nmap("<Leader><Leader>", ":nohlsearch<CR>", {silent = true})

-- Consistent indent/unindent across all modes
vim.nmap("<C-d>", "<<")
vim.nmap("<C-t>", ">>")
vim.xmap("<C-d>", "<gv")
vim.xmap("<C-t>", ">gv")

-- Move around more quickly
vim.nmap("<C-n>", "<NOP>")
vim.xmap("<C-n>", "<NOP>")

vim.nmap("<C-u>", "<NOP>")
vim.xmap("<C-u>", "<NOP>")
--
vim.nmap("<M-k>", "{")
vim.xmap("<M-k>", "{")
vim.nmap("<M-j>", "}")
vim.xmap("<M-j>", "}")
vim.nmap("<M-h>", "0")
vim.xmap("<M-h>", "0")
vim.nmap("<M-l>", "$")
vim.xmap("<M-l>", "$")

-- Splits
vim.nmap("<C-w>|", ":vsplit<CR>",             {silent = true})
vim.nmap("<C-w>_", ":split<CR>",              {silent = true})
vim.nmap("<C-w>h", ":vertical resize +5<CR>", {silent = true})
vim.nmap("<C-w>j", ":resize -5<CR>",          {silent = true})
vim.nmap("<C-w>k", ":resize +5<CR>",          {silent = true})
vim.nmap("<C-w>l", ":vertical resize -5<CR>", {silent = true})

-- Ctag navigation
vim.nmap("<Leader>[", ":pop<CR>", {silent = true})
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

vim.nmap("gd", "v:lua.vim.lsp.buf.definition()",     {expr = true})
vim.nmap("gD", "v:lua.vim.lsp.buf.declaration()",    {expr = true})
vim.nmap("gi", "v:lua.vim.lsp.buf.implementation()", {expr = true})
vim.nmap("gr", "v:lua.vim.lsp.buf.references()",     {expr = true})
vim.nmap("F",  "v:lua.vim.lsp.buf.formatting()",     {expr = true})
vim.nmap("K",  "v:lua.vim.lsp.buf.hover()",          {expr = true})

vim.o  = vim.__o
vim.wo = vim.__wo
vim.bo = vim.__bo

--- Plugins
require("plugins")

--- Overrides
require("init.plugins")
require.tree("init")

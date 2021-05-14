local colors = require("colors.nord").colors
vim = _G.vim

-- AndrewRadev/splitjoin.vim
vim.g.splitjoin_quiet = 1

vim.g.splitjoin_join_mapping  = "cJ"
vim.g.splitjoin_split_mapping = "cK"

-- Yggdroot/indentLine
vim.g.indentLine_char_list = {"|", "¦", "┆", "┊"}
vim.g.indentLine_fileTypeExclude = {"help", "startify"}

-- andymass/vim-matchup
vim.g.matchup_matchparen_deferred           = 1
vim.g.matchup_matchparen_hi_surround_always = 1
vim.g.matchup_matchparen_offscreen          = {method = "popup"}
vim.g.matchup_surround_enabled              = 1

-- arcticicestudio/nord-vim
vim.g.nord_cursor_line_number_background = 1
vim.g.nord_italic                        = 1
vim.g.nord_italic_comments               = 1
vim.g.nord_underline                     = 1

vim.cmd("colorscheme nord")

-- famiu/feline.nvim
require("init.plugins.statusline")

-- hrsh7th/nvim-compe
require("compe").setup({
  source = {
    buffer = true,
    nvim_lsp = true,
    nvim_lua = true,
    path = true
  }
})

vim.imap("<CR>",  "compe#confirm('<CR>')", {expr = true})
vim.imap("<C-e>", "compe#close('<C-e>')",  {expr = true})

vim.imap("<Tab>",   "v:lua.compe.tab()",   {expr = true})
vim.smap("<Tab>",   "v:lua.compe.tab()",   {expr = true})
vim.imap("<S-Tab>", "v:lua.compe.s_tab()", {expr = true})
vim.smap("<S-Tab>", "v:lua.compe.s_tab()", {expr = true})

_G.compe = (function()
  local function termcode(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local function cursor_is_blank()
    local col = vim.fn.col(".") - 1
    if col == 0 then
      return true
    end

    local line = vim.fn.getline(".")
    if line:sub(col, col):match("%s") then
      return true
    end

    return false
  end

  local function forward()
    if vim.fn.pumvisible() == 1 then
      return termcode("<C-n>")
    end

    if cursor_is_blank() then
      return termcode("<Tab>")
    end

    return vim.fn["compe#complete"]()
  end

  local function backward()
    if vim.fn.pumvisible() == 1 then
      return termcode("<C-p>")
    end

    return termcode("<S-Tab>")
  end

  return {
    tab = forward,
    s_tab = backward
  }
end)()

-- itmammoth/doorboy.vim
vim.imap("<BS>",    "doorboy#map_backspace()", {expr = true})
vim.imap("<Space>", "doorboy#map_space()",     {expr = true})
vim.imap("<CR>",    "doorboy#map_cr()",        {expr = true})

-- junegunn/vim-easy-align
vim.nmap("<Leader>a", "<Plug>(EasyAlign)", {noremap = false})
vim.xmap("<CR>",      "<Plug>(EasyAlign)", {noremap = false})

-- kyazdani42/nvim-web-devicons
require("nvim-web-devicons").setup({
  override = {
    ["dos"] = {
      icon = ""
    },
    ["mac"] = {
      icon = ""
    },
    ["unix"] = {
      icon = ""
    }
  }
})

-- lewis6991/gitsigns.nvim
require("gitsigns").setup({
  keymaps = {}
})

-- mhinz/vim-startify
vim.g.startify_change_to_dir      = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_relative_path      = 1
vim.g.startify_custom_header      = vim.split([[


          ::::    ::: :::::::::: ::::::::  :::     ::: :::::::::::   :::   :::
         :+:+:   :+: :+:       :+:    :+: :+:     :+:     :+:      :+:+: :+:+:
        :+:+:+  +:+ +:+       +:+    +:+ +:+     +:+     +:+     +:+ +:+:+ +:+
       +#+ +:+ +#+ +#++:++#  +#+    +:+ +#+     +:+     +#+     +#+  +:+  +#+
      +#+  +#+#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+       +#+
     #+#   #+#+# #+#       #+#    #+#   #+#+#+#       #+#     #+#       #+#
    ###    #### ########## ########      ###     ########### ###       ###
    +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
    -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
]], "\n")


-- milkypostman/vim-togglelist
vim.g.toggle_list_no_mappings = 1

vim.nmap("<Leader>p", ":call ToggleQuickfixList()<CR>", {silent = true})
vim.nmap("<Leader>P", ":call ToggleLocationList()<CR>", {silent = true})

-- neovim/nvim-lspconfig & kabouzeid/nvim-lspinstall
local lspconfig = require("lspconfig")
local lspinstall = require("lspinstall")

lspinstall.setup()

for _, server in pairs(lspinstall.installed_servers()) do
  local ok, options = pcall(function()
    return require(string.join({"init", "plugins", "lsp", server}, "."))
  end)

  lspconfig[server].setup(ok and options(lspconfig[server]) or {})
end

-- norcalli/nvim-colorizer.lua
require("colorizer").setup()

-- nvim-telescope/telescope.nvim
require("telescope").setup({
  defaults = {
    color_devicons = false,
    mappings = {
      i = {
        ["<C-n>"] = false,
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<M-j>"] = require("telescope.actions").move_selection_next,

        ["<C-p>"] = false,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
        ["<M-k>"] = require("telescope.actions").move_selection_previous,

        ["<C-u>"] = require("telescope.actions").preview_scrolling_up,
        ["<C-d>"] = require("telescope.actions").preview_scrolling_down,

        ["<C-v>"]  = false,
        ["<M-\\>"] = require("telescope.actions").select_vertical,
        ["<C-\\>"] = require("telescope.actions").select_vertical,

        ["<C-x>"] = false,
        ["<C-_>"] = require("telescope.actions").select_horizontal,
        ["<M-_>"] = require("telescope.actions").select_horizontal,

        ["<C-t>"] = false,
        ["<C-c>"] = require("telescope.actions").close
    },
    n = {
        ["<C-n>"] = false,
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<M-j>"] = require("telescope.actions").move_selection_next,

        ["<C-p>"] = false,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
        ["<M-k>"] = require("telescope.actions").move_selection_previous,

        ["<C-u>"] = require("telescope.actions").preview_scrolling_up,
        ["<C-d>"] = require("telescope.actions").preview_scrolling_down,

        ["<C-v>"]  = false,
        ["<M-\\>"] = require("telescope.actions").select_vertical,
        ["<C-\\>"] = require("telescope.actions").select_vertical,

        ["<C-x>"] = false,
        ["<C-_>"] = require("telescope.actions").select_horizontal,
        ["<M-_>"] = require("telescope.actions").select_horizontal,

        ["<C-t>"] = false,
        ["<C-c>"] = require("telescope.actions").close
      }
    }
  }
})

require("telescope").load_extension("fzf_writer")

vim.nmap("<C-p>", ":lua require('telescope').extensions.fzf_writer.files()<CR>", {silent = true})
vim.nmap("<M-p>", ":lua require('telescope').extensions.fzf_writer.grep()<CR>",  {silent = true})

-- nvim-treesitter/nvim-treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = "maintained",
  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "gnn",
      node_decremental = "gNN"
    }
  },
  indent = {
    enable = true
  }
})

-- psliwka/vim-smoothie
vim.g.smoothie_no_default_mappings = 1

vim.nmap("<C-f>", "<Plug>(SmoothieForwards)", {noremap = false})
vim.xmap("<C-f>", "<Plug>(SmoothieForwards)", {noremap = false})

vim.nmap("<C-b>", "<Plug>(SmoothieBackwards)", {noremap = false})
vim.xmap("<C-b>", "<Plug>(SmoothieBackwards)", {noremap = false})

-- romgrk/barbar.nvim
vim.g.bufferline = {
  animation          = false,
  clickable          = false,
  closable           = true,
  icon_close_tab     = "",
  icon_custom_colors = "BufferCurrent",
  icons              = "both",
  tabpages           = false
}

vim.hl("BufferCurrent",      {bg = colors[3], fg = colors[6]})
vim.hl("BufferCurrentIndex", {bg = colors[3], fg = colors[6]})
vim.hl("BufferCurrentMod",   {bg = colors[3], fg = colors[6]})
vim.hl("BufferCurrentSign",  {bg = colors[3], fg = colors[6]})

vim.hl_link("BufferVisible",      "BufferCurrent")
vim.hl_link("BufferVisibleIndex", "BufferCurrentIndex")
vim.hl_link("BufferVisibleMod",   "BufferCurrentMod")
vim.hl_link("BufferVisibleSign",  "BufferCurrentSign")

vim.hl("BufferInactive",      {bg = colors.bg, fg = colors.fg})
vim.hl("BufferInactiveIndex", {bg = colors.bg, fg = colors.fg})
vim.hl("BufferInactiveMod",   {bg = colors.bg, fg = colors.fg})
vim.hl("BufferInactiveSign",  {bg = colors.bg, fg = colors.fg})

vim.hl("BufferTabpageFill", {bg = colors[0]})

vim.nmap("<Leader>BB", ":BufferClose<CR>",              {silent = true})
vim.nmap("<Leader>BD", ":BufferCloseAllButCurrent<CR>", {silent = true})
vim.nmap("<Leader>H",  ":BufferMovePrevious<CR>",       {silent = true})
vim.nmap("<Leader>L",  ":BufferMoveNext<CR>",           {silent = true})
vim.nmap("<Leader>b",  ":enew<CR>",                     {silent = true})
vim.nmap("<Leader>h",  ":BufferPrevious<CR>",           {silent = true})
vim.nmap("<Leader>l",  ":BufferNext<CR>",               {silent = true})

-- svermeulen/vim-cutlass
vim.nmap("m",  "d")
vim.xmap("m",  "d")
vim.nmap("mm", "dd")
vim.nmap("M",  "D")

-- wfxr/minimap.vim
vim.g.minimap_highlight       = "CursorLine"
vim.g.minimap_highlight_range = true

vim.g.minimap_block_buftypes = {"nofile", "nowrite", "prompt", "quickfix", "terminal"}
vim.g.minimap_close_buftypes = {}

vim.g.minimap_block_filetypes = {"gitcommit", "packer", "startify"}
vim.g.minimap_close_filetypes = vim.g.minimap_block_filetypes

vim.nmap("<C-m>", ":MinimapToggle<CR>",  {silent = true})
vim.nmap("<M-m>", ":MinimapRefresh<CR>", {silent = true})

-- zirrostig/vim-schlepp
vim.xmap("<Leader>h", "<Plug>SchleppLeft",  {noremap = false})
vim.xmap("<Leader>j", "<Plug>SchleppDown",  {noremap = false})
vim.xmap("<Leader>k", "<Plug>SchleppUp",    {noremap = false})
vim.xmap("<Leader>l", "<Plug>SchleppRight", {noremap = false})

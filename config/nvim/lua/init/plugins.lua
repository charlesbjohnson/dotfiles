require("ext.string")

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

-- itchyny/lightline.vim
vim.g.lightline = {
  colorscheme = "nord",
  active = {
    left = {
      {"mode", "paste"},
      {"gitbranch", "readonly", "filename", "modified"}
    },
    right = {
      {"lineinfo"},
      {"percent"},
      {"fileformat", "fileencoding", "filetype"}
    }
  },
  component_expand = {
    buffers = "lightline#bufferline#buffers"
  },
  component_function = {
    filetype = "LightlineFileType",
    fileformat = "LightlineFileFormat",
    gitbranch = "gitbranch#name"
  },
  component_type = {
    buffers = "tabsel"
  },
  separator = {
    left = "",
    right = ""
  },
  subseparator = {
    left = "",
    right = ""
  },
  tabline = {
    left = {{"buffers"}},
    right = {{}}
  }
}

_G.lightline = (function()
  local web_devicons = require("nvim-web-devicons")

  local function file_type()
    if vim.fn.winwidth(0) <= 70 then
      return ""
    end

    local type = (vim.bo.filetype or "no ft")
    local icon = web_devicons.get_icon(vim.fn.expand("%"), vim.fn.expand("%:e"))

    return string.join({type, icon}, " ")
  end

  local function file_format()
    if vim.fn.winwidth(0) <= 70 then
      return ""
    end

    local format = vim.bo.fileformat
    local icon = web_devicons.get_icon(format)

    return string.join({format, icon}, " ")
  end

  return {
    file_type = file_type,
    file_format = file_format
  }
end)()

vim.cmd([[
  function! g:LightlineFileType() abort
    return v:lua.lightline.file_type()
  endfunction

  function! g:LightlineFileFormat() abort
    return v:lua.lightline.file_format()
  endfunction
]])

-- itmammoth/doorboy.vim
vim.imap("<BS>",    "doorboy#map_backspace()", {expr = true})
vim.imap("<Space>", "doorboy#map_space()",     {expr = true})
vim.imap("<CR>",    "doorboy#map_cr()",        {expr = true})

-- junegunn/fzf
vim.nmap("<C-p>", ":FZF<CR>", {silent = true})

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

-- mengelbrecht/lightline-bufferline
vim.g["lightline#bufferline#enable_devicons"] = 1
vim.g["lightline#bufferline#show_number"] = 2

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

vim.nmap(">", "<Plug>(SmoothieDownwards)", {noremap = false})
vim.xmap(">", "<Plug>(SmoothieDownwards)", {noremap = false})

vim.nmap("<", "<Plug>(SmoothieUpwards)", {noremap = false})
vim.xmap("<", "<Plug>(SmoothieUpwards)", {noremap = false})

-- svermeulen/vim-cutlass
vim.nmap("m",  "d")
vim.xmap("m",  "d")
vim.nmap("mm", "dd")
vim.nmap("M",  "D")

-- zirrostig/vim-schlepp
vim.xmap("<Leader>h", "<Plug>SchleppLeft",  {noremap = false})
vim.xmap("<Leader>j", "<Plug>SchleppDown",  {noremap = false})
vim.xmap("<Leader>k", "<Plug>SchleppUp",    {noremap = false})
vim.xmap("<Leader>l", "<Plug>SchleppRight", {noremap = false})

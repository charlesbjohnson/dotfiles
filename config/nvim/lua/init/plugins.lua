-- AndrewRadev/splitjoin.vim
vim.g.splitjoin_quiet = 1

vim.g.splitjoin_join_mapping = "cJ"
vim.g.splitjoin_split_mapping = "cK"

-- akinsho/toggleterm.nvim
require("toggleterm").setup({
  open_mapping = "<C-x>",
  shade_terminals = false,
})

-- andymass/vim-matchup
vim.g.matchup_matchparen_deferred = 1
vim.g.matchup_matchparen_offscreen = { method = "popup" }
vim.g.matchup_surround_enabled = 1

-- arcticicestudio/nord-vim
vim.g.nord_cursor_line_number_background = 1
vim.g.nord_italic = 1
vim.g.nord_italic_comments = 1
vim.g.nord_underline = 1

vim.cmd("colorscheme nord")

-- aserowy/tmux.nvim
require("tmux").setup({
  copy_sync = {
    enable = false,
  },
  navigation = {
    cycle_navigation = false,
    enable_default_keybindings = true,
  },
})

-- b3nj5m1n/kommentary
require("kommentary.config").configure_language("default", {
  prefer_single_line_comments = true,
})

-- famiu/feline.nvim
require("init.plugins.statusline")

-- folke/trouble.nvim
require("trouble").setup()

vim.nmap("<C-n>", "<Cmd>TroubleToggle lsp_document_diagnostics<CR>", { silent = true })
vim.nmap("<C-M-n>", "<Cmd>TroubleToggle lsp_workspace_diagnostics<CR>", { silent = true })

-- hrsh7th/nvim-cmp
require("cmp").setup({
  mapping = {
    ["<CR>"] = require("cmp").mapping.confirm(),
    ["<C-e>"] = require("cmp").mapping.abort(),

    ["<C-b>"] = require("cmp").mapping.scroll_docs(-4),
    ["<C-f>"] = require("cmp").mapping.scroll_docs(4),

    ["<Tab>"] = function(fallback)
      local col = vim.fn.col(".") - 1

      if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n")
      elseif vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      local col = vim.fn.col(".") - 1

      if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true), "n")
      elseif vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
      else
        fallback()
      end
    end,
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "buffer" },
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
  },
})

-- junegunn/vim-easy-align
vim.nmap("<Leader>a", "<Plug>(EasyAlign)", { noremap = false })
vim.xmap("<CR>", "<Plug>(EasyAlign)", { noremap = false })

-- kevinhwang91/nvim-hlslens
require("hlslens").setup({
  calm_down = true,
  nearest_only = true,
})

vim.nmap("n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", {
  silent = true,
})
vim.nmap("N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", {
  silent = true,
})

vim.nmap("* *", "<Cmd>lua require('hlslens').start()<CR>")
vim.nmap("# #", "<Cmd>lua require('hlslens').start()<CR>")

vim.nmap("g* g*", "<Cmd>lua require('hlslens').start()<CR>")
vim.nmap("g# g#", "<Cmd>lua require('hlslens').start()<CR>")

-- kyazdani42/nvim-tree.lua
require("nvim-tree").setup()

vim.g.nvim_tree_disable_default_keybindings = true
vim.g.nvim_tree_bindings = {
  { key = "<CR>", cb = require("nvim-tree.config").nvim_tree_callback("edit") },
  { key = "<BS>", cb = require("nvim-tree.config").nvim_tree_callback("close_node") },
  { key = "<Tab>", cb = require("nvim-tree.config").nvim_tree_callback("preview") },
  { key = "<C-\\>", cb = require("nvim-tree.config").nvim_tree_callback("vsplit") },
  { key = "<C-_>", cb = require("nvim-tree.config").nvim_tree_callback("split") },
  { key = "r", cb = require("nvim-tree.config").nvim_tree_callback("rename") },
  { key = "d", cb = require("nvim-tree.config").nvim_tree_callback("remove") },
}

vim.nmap("<C-b>", "<Cmd>NvimTreeToggle<CR>", { silent = true })
vim.nmap("<C-M-b>", "<Cmd>NvimTreeRefresh<CR>", { silent = true })

-- lewis6991/gitsigns.nvim
require("gitsigns").setup({
  keymaps = {},
})

-- lukas-reineke/indent-blankline.nvim
require("indent_blankline").setup({
  char_list = { "|", "¦", "┆", "┊" },

  buftype_exclude = { "terminal" },
  filetype_exclude = { "help", "startify" },

  use_treesitter = true,

  show_current_context = true,
  show_first_indent_level = false,
  show_trailing_blankline_indent = false,
})

-- mhinz/vim-startify
vim.g.startify_change_to_dir = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_relative_path = 1
vim.g.startify_custom_header = ([[


          ::::    ::: :::::::::: ::::::::  :::     ::: :::::::::::   :::   :::
         :+:+:   :+: :+:       :+:    :+: :+:     :+:     :+:      :+:+: :+:+:
        :+:+:+  +:+ +:+       +:+    +:+ +:+     +:+     +:+     +:+ +:+:+ +:+
       +#+ +:+ +#+ +#++:++#  +#+    +:+ +#+     +:+     +#+     +#+  +:+  +#+
      +#+  +#+#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+       +#+
     #+#   #+#+# #+#       #+#    #+#   #+#+#+#       #+#     #+#       #+#
    ###    #### ########## ########      ###     ########### ###       ###
    +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
    -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
]]):split("\n")

-- neovim/nvim-lspconfig
-- jose-elias-alvarez/null-ls.nvim
-- kabouzeid/nvim-lspinstall
local lspconfig = require("lspconfig")
local lspinstall = require("lspinstall")
local lspnull = require("null-ls")

lspinstall.setup()
lspnull.config({ diagnostics_format = "[#{c}] #{m} (#{s})" })

for _, server in ipairs(vim.list_extend(lspinstall.installed_servers(), { "null-ls" })) do
  local options = (require.try(string.join({ "init", "plugins", "lsp", server }, ".")) or function()
    return {}
  end)()

  lspconfig[server].setup(vim.tbl_deep_extend("force", {}, options, {
    on_attach = function(client)
      if type(options.on_attach) == "function" then
        options.on_attach(client)
      end

      -- RRethy/vim-illuminate
      require("illuminate").on_attach(client)

      -- ray-x/lsp_signature.nvim
      require("lsp_signature").on_attach({
        bind = true,
        handler_opts = { border = "none" },
        hint_enable = false,
      })
    end,

    flags = {
      debounce_text_changes = 100,
    },
  }))
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

        ["<C-v>"] = false,
        ["<M-\\>"] = require("telescope.actions").select_vertical,
        ["<C-\\>"] = require("telescope.actions").select_vertical,

        ["<C-x>"] = false,
        ["<C-_>"] = require("telescope.actions").select_horizontal,
        ["<M-_>"] = require("telescope.actions").select_horizontal,

        ["<C-t>"] = false,
        ["<C-c>"] = require("telescope.actions").close,
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

        ["<C-v>"] = false,
        ["<M-\\>"] = require("telescope.actions").select_vertical,
        ["<C-\\>"] = require("telescope.actions").select_vertical,

        ["<C-x>"] = false,
        ["<C-_>"] = require("telescope.actions").select_horizontal,
        ["<M-_>"] = require("telescope.actions").select_horizontal,

        ["<C-t>"] = false,
        ["<C-c>"] = require("telescope.actions").close,
      },
    },
  },
})

require("telescope").load_extension("fzf")

vim.nmap("<C-p>", "<Cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>", { silent = true })
vim.nmap("<C-M-p>", "<Cmd>lua require('telescope.builtin').commands()<CR>", { silent = true })
vim.nmap("<C-_>", "<Cmd>lua require('telescope.builtin').live_grep()<CR>", { silent = true })

-- nvim-treesitter/nvim-treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "gnn",
      node_decremental = "gNN",
    },
  },
  indent = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
})

-- psliwka/vim-smoothie
vim.g.smoothie_no_default_mappings = 1

vim.nmap("<C-M-j>", "<Plug>(SmoothieForwards)", { noremap = false })
vim.xmap("<C-M-j>", "<Plug>(SmoothieForwards)", { noremap = false })

vim.nmap("<C-M-k>", "<Plug>(SmoothieBackwards)", { noremap = false })
vim.xmap("<C-M-k>", "<Plug>(SmoothieBackwards)", { noremap = false })

-- romgrk/barbar.nvim
vim.g.bufferline = {
  animation = false,
  clickable = false,
  closable = true,
  icon_close_tab = "",
  icon_custom_colors = "BufferCurrent",
  icons = "both",
  tabpages = false,
}

local colors = require("colors")

vim.hl("BufferCurrent", { bg = colors[3], fg = colors[6] })
vim.hl("BufferCurrentIndex", { bg = colors[3], fg = colors[6] })
vim.hl("BufferCurrentMod", { bg = colors[3], fg = colors[6] })
vim.hl("BufferCurrentSign", { bg = colors[3], fg = colors[6] })

vim.hl_link("BufferVisible", "BufferCurrent")
vim.hl_link("BufferVisibleIndex", "BufferCurrentIndex")
vim.hl_link("BufferVisibleMod", "BufferCurrentMod")
vim.hl_link("BufferVisibleSign", "BufferCurrentSign")

vim.hl("BufferInactive", { bg = colors.bg, fg = colors.fg })
vim.hl("BufferInactiveIndex", { bg = colors.bg, fg = colors.fg })
vim.hl("BufferInactiveMod", { bg = colors.bg, fg = colors.fg })
vim.hl("BufferInactiveSign", { bg = colors.bg, fg = colors.fg })

vim.hl("BufferTabpageFill", { bg = colors[0] })

vim.nmap("<Leader>BB", "<Cmd>BufferClose<CR>", { silent = true })
vim.nmap("<Leader>BD", "<Cmd>BufferCloseAllButCurrent<CR>", { silent = true })
vim.nmap("<Leader>H", "<Cmd>BufferMovePrevious<CR>", { silent = true })
vim.nmap("<Leader>L", "<Cmd>BufferMoveNext<CR>", { silent = true })
vim.nmap("<Leader>b", "<Cmd>enew<CR>", { silent = true })
vim.nmap("<Leader>h", "<Cmd>BufferPrevious<CR>", { silent = true })
vim.nmap("<Leader>l", "<Cmd>BufferNext<CR>", { silent = true })

-- steelsojka/pears.nvim
require("pears").setup(function(config)
  config.preset("tag_matching")
end)

-- svermeulen/vim-cutlass
vim.nmap("m", "d")
vim.xmap("m", "d")
vim.nmap("mm", "dd")
vim.nmap("M", "D")

-- wfxr/minimap.vim
vim.g.minimap_highlight = "CursorLine"
vim.g.minimap_highlight_range = true
vim.g.minimap_highlight_search = true

vim.g.minimap_block_buftypes = { "nofile", "nowrite", "prompt", "quickfix", "terminal" }
vim.g.minimap_close_buftypes = {}

vim.g.minimap_block_filetypes = { "gitcommit", "packer", "startify" }
vim.g.minimap_close_filetypes = vim.g.minimap_block_filetypes

-- zirrostig/vim-schlepp
vim.xmap("<Leader>h", "<Plug>SchleppLeft", { noremap = false })
vim.xmap("<Leader>j", "<Plug>SchleppDown", { noremap = false })
vim.xmap("<Leader>k", "<Plug>SchleppUp", { noremap = false })
vim.xmap("<Leader>l", "<Plug>SchleppRight", { noremap = false })

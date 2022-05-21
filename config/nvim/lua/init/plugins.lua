require("init.plugins.colorscheme")
require("init.plugins.lsp")
require("init.plugins.statusline")

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

-- folke/trouble.nvim
require("trouble").setup()

vim.keymap.set("n", "<C-n>", function()
  require("trouble").toggle("document_diagnostics")
end, { silent = true })

vim.keymap.set("n", "<C-M-n>", function()
  require("trouble").toggle("workspace_diagnostics")
end, { silent = true })

-- goolord/alpha-nvim
require("alpha").setup(require("alpha.themes.startify").config)

-- hrsh7th/nvim-cmp
require("cmp").setup({
  mapping = {
    ["<CR>"] = require("cmp").mapping.confirm(),
    ["<C-e>"] = require("cmp").mapping.abort(),

    ["<C-b>"] = require("cmp").mapping.scroll_docs(-4),
    ["<C-f>"] = require("cmp").mapping.scroll_docs(4),

    ["<Tab>"] = require("cmp").mapping.select_next_item(),
    ["<S-Tab>"] = require("cmp").mapping.select_prev_item(),
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "buffer" },
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "nvim_lua" },
    { name = "path" },
  },
  window = {
    completion = {
      border = "shadow",
    },
    documentation = {
      border = "shadow",
    },
  },
})

-- ibhagwan/fzf-lua
require("fzf-lua").setup({
  actions = {
    files = {
      ["default"] = require("fzf-lua.actions").file_edit,
    },
  },
  file_icon_padding = " ",
  keymap = {
    builtin = {},
    fzf = {},
  },
  winopts = {
    fullscreen = true,
    preview = {
      default = "bat",
    },
  },
})

vim.keymap.set("n", "<C-p>", require("fzf-lua").files, { silent = true })
vim.keymap.set("n", "<C-M-p>", require("fzf-lua").commands, { silent = true })
vim.keymap.set("n", "<C-_>", require("fzf-lua").live_grep_native, { silent = true })

-- junegunn/vim-easy-align
vim.keymap.set("n", "<Leader>a", "<Plug>(EasyAlign)")
vim.keymap.set("x", "<CR>", "<Plug>(EasyAlign)")

-- karb94/neoscroll.nvim
require("neoscroll").setup({
  mappings = {},
  easing_function = "circular",
})

require("neoscroll.config").set_mappings({
  ["<C-M-j>"] = { "scroll", { "0.7", "true", "300" } },
  ["<C-M-k>"] = { "scroll", { "-0.7", "true", "300" } },
})

-- kevinhwang91/nvim-hlslens
require("hlslens").setup({
  calm_down = true,
  nearest_only = true,
})

vim.keymap.set("n", "n", function()
  pcall(vim.cmd, "normal! " .. vim.v.count1 .. "n")
  require("hlslens").start()
end, { silent = true })

vim.keymap.set("n", "N", function()
  pcall(vim.cmd, "normal! " .. vim.v.count1 .. "N")
  require("hlslens").start()
end, { silent = true })

vim.keymap.set("n", "* *", require("hlslens").start)
vim.keymap.set("n", "# #", require("hlslens").start)

vim.keymap.set("n", "g* g*", require("hlslens").start)
vim.keymap.set("n", "g# g#", require("hlslens").start)

-- lewis6991/gitsigns.nvim
require("gitsigns").setup()

-- lukas-reineke/indent-blankline.nvim
require("indent_blankline").setup({
  char_list = { "|", "¦", "┆", "┊" },

  buftype_exclude = { "terminal" },
  filetype_exclude = { "help", "alpha" },

  use_treesitter = true,

  show_current_context = true,
  show_first_indent_level = false,
  show_trailing_blankline_indent = false,
})

-- norcalli/nvim-colorizer.lua
require("colorizer").setup()

-- nvim-neo-tree/neo-tree.nvim
require("neo-tree").setup({
  close_if_last_window = true,
  window = {
    position = "right",
    mappings = {
      ["<BS>"] = "close_node",
      ["C"] = "",

      ["<C-\\>"] = "open_vsplit",
      ["s"] = "",

      ["<C-_>"] = "open_split",
      ["S"] = "",

      ["<ESC>"] = "clear_filter",
      ["<c-x>"] = "",

      ["p"] = "",
      ["x"] = "",
      ["y"] = "",
    },
  },
})

vim.keymap.set("n", "<C-b>", function()
  require("neo-tree").show("", true)
end, { silent = true })

-- nvim-treesitter/nvim-treesitter
require("nvim-treesitter.configs").setup({
  autotag = {
    enable = true,
  },
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

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- petertriho/nvim-scrollbar
require("scrollbar").setup({
  excluded_buftypes = { "nofile", "nowrite", "prompt", "quickfix", "terminal" },
  excluded_filetypes = { "gitcommit", "packer", "alpha" },
  handlers = {
    diagnostic = true,
    search = true,
  },
})

-- romgrk/barbar.nvim
vim.g.bufferline = {
  animation = false,
  clickable = false,
  closable = true,
  icon_close_tab = "",
  icons = true,
  tabpages = false,
}

vim.keymap.set("n", "<Leader>BB", "<Cmd>BufferClose<CR>", { silent = true })
vim.keymap.set("n", "<Leader>BD", "<Cmd>BufferCloseAllButCurrent<CR>", { silent = true })
vim.keymap.set("n", "<Leader>H", "<Cmd>BufferMovePrevious<CR>", { silent = true })
vim.keymap.set("n", "<Leader>L", "<Cmd>BufferMoveNext<CR>", { silent = true })
vim.keymap.set("n", "<Leader>b", "<Cmd>enew<CR>", { silent = true })
vim.keymap.set("n", "<Leader>h", "<Cmd>BufferPrevious<CR>", { silent = true })
vim.keymap.set("n", "<Leader>l", "<Cmd>BufferNext<CR>", { silent = true })

-- svermeulen/vim-cutlass
vim.keymap.set("n", "m", "d")
vim.keymap.set("x", "m", "d")
vim.keymap.set("n", "mm", "dd")
vim.keymap.set("n", "M", "D")

-- windwp/nvim-autopairs
require("nvim-autopairs").setup({})
require("nvim-autopairs").add_rules(require("nvim-autopairs.rules.endwise-lua"))
require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())

-- zirrostig/vim-schlepp
vim.keymap.set("x", "<Leader>h", "<Plug>SchleppLeft")
vim.keymap.set("x", "<Leader>j", "<Plug>SchleppDown")
vim.keymap.set("x", "<Leader>k", "<Plug>SchleppUp")
vim.keymap.set("x", "<Leader>l", "<Plug>SchleppRight")

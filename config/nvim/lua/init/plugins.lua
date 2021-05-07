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

-- dense-analysis/ale
vim.g.ale_disable_lsp = 1

vim.g.ale_fix_on_save = 1
vim.g.ale_fixers      = vim.empty_dict()

vim.g.ale_lint_on_save         = 1
vim.g.ale_lint_on_text_changed = "never"
vim.g.ale_linters              = vim.empty_dict()

vim.g.ale_set_loclist  = 0
vim.g.ale_set_quickfix = 0

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

vim.cmd([[
  function! g:LightlineFileType() abort
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  endfunction

  function! g:LightlineFileFormat() abort
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
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

-- neoclide/coc.nvim
vim.cmd([[
  inoremap <silent> <expr> <TAB> pumvisible() ? "<C-n>" : g:CocCheckBackspace() ? "<TAB>" : coc#refresh()
  inoremap <expr> <S-TAB> pumvisible() ? "<C-p>" : "<C-h>"

  inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\C-y>" : "<C-g>u<CR>"

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  nnoremap <silent> K :call g:CocShowDocumentation()<CR>

  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)

  xmap <silent> v <Plug>(coc-range-select)

  autocmd ColorScheme * hi CocCursorRange ctermbg=red guibg=red

  nmap <expr> <silent> <C-i> g:CocSelectCurrentCursor('normal')
  xmap <expr> <silent> <C-i> g:CocSelectCurrentCursor('visual')

  function! g:CocCheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  function! g:CocShowDocumentation() abort
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  let g:CocPreviousCursorMode = ''

  function! g:CocSelectCurrentCursor(mode) abort
    if !get(g:, 'coc_cursors_activated', 0)
      let g:CocPreviousCursorMode = a:mode

      if a:mode == 'visual'
        return "y/\V<C-r>=escape(@", '/')<CR><CR>Ngn<Plug>(coc-cursors-range)n:nohlsearch<CR>"
      endif

      return "<Plug>(coc-cursors-word)"
    end

    if g:CocPreviousCursorMode == 'visual'
      return "gN<Plug>(coc-cursors-range)n:nohlsearch<CR>"
    endif

    return "*<Plug>(coc-cursors-word):nohlsearch<CR>"
  endfunction
]])


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

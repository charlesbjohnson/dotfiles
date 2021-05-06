local function startup(registration)
  registration(function(name, ...)
    vim.fn["plug#"](name, ...)
  end)
end

startup(function (plug)
  -- Text Objects
  plug("Julian/vim-textobj-variable-segment")
  plug("glts/vim-textobj-comment")
  plug("kana/vim-textobj-entire")
  plug("kana/vim-textobj-indent")
  plug("kana/vim-textobj-line")
  plug("kana/vim-textobj-user")

  -- Motions
  plug("christoomey/vim-sort-motion")
  plug("tpope/vim-commentary")
  plug("tpope/vim-repeat")
  plug("tpope/vim-surround")
  plug("vim-scripts/repmo.vim")

  -- Application Controls
  plug("christoomey/vim-tmux-navigator")
  plug("junegunn/fzf")
  plug("mhinz/vim-sayonara")
  plug("milkypostman/vim-togglelist")
  plug("rhysd/committia.vim")
  plug("roxma/vim-tmux-clipboard")
  plug("tpope/vim-vinegar")

  -- Application Enhancements
  plug("danro/rename.vim")
  plug("editorconfig/editorconfig-vim")

  -- Editor Controls
  plug("AndrewRadev/splitjoin.vim", {branch = "main"})
  plug("itmammoth/doorboy.vim")
  plug("junegunn/vim-easy-align")
  plug("psliwka/vim-smoothie")
  plug("svermeulen/vim-cutlass")
  plug("zirrostig/vim-schlepp")

  -- Editor Enhancements
  plug("dense-analysis/ale")
  plug("neoclide/coc.nvim", {branch = "release"})

  -- Search & Replace
  plug("RRethy/vim-illuminate")
  plug("andymass/vim-matchup")

  -- Editor Appearance
  plug("Yggdroot/indentLine")
  plug("arcticicestudio/nord-vim")
  plug("edkolev/tmuxline.vim")
  plug("itchyny/lightline.vim")
  plug("mengelbrecht/lightline-bufferline")
  plug("mhinz/vim-signify")
  plug("mhinz/vim-startify")
  plug("ryanoasis/vim-devicons")

  -- Syntax & Language Enhancements
  plug("cespare/vim-toml",              {["for"] = {"toml"}})
  plug("dag/vim-fish",                  {["for"] = {"fish"}})
  plug("elzr/vim-json",                 {["for"] = {"json"}})
  plug("masukomi/vim-markdown-folding", {["for"] = {"markdown"}})
  plug("tpope/vim-git",                 {["for"] = {"gitconfig"}})
end)

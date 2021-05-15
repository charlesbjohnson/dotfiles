local fs = require("fs")
local path = require("path")

local packer_install_path = path.join({vim.fn.stdpath("data"), "site/pack/packer/opt/packer.nvim"})
local packer_compile_path = path.join({vim.fn.stdpath("config"), "plugin/packer.vim"})

if not fs.exists(packer_install_path) then
  vim.fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", packer_install_path})
end

vim.cmd("packadd packer.nvim")

return require("packer").startup({
  function(use)
    use({"wbthomason/packer.nvim", opt = true})

    -- Text Objects
    use("fvictorio/vim-textobj-backticks")
    use("kana/vim-textobj-indent")
    use("kana/vim-textobj-line")
    use("kana/vim-textobj-user")

    -- Motions
    use("christoomey/vim-sort-motion")
    use("tpope/vim-commentary")
    use("tpope/vim-repeat")
    use("tpope/vim-surround")
    use("vim-scripts/repmo.vim")

    -- Application Controls
    use("christoomey/vim-tmux-navigator")
    use("kyazdani42/nvim-tree.lua")
    use("milkypostman/vim-togglelist")
    use("nvim-telescope/telescope-fzf-writer.nvim")
    use("nvim-telescope/telescope.nvim")
    use("rhysd/committia.vim")
    use("roxma/vim-tmux-clipboard")
    use("wfxr/minimap.vim")

    -- Application Enhancements
    use("editorconfig/editorconfig-vim")

    -- Editor Controls
    use({"AndrewRadev/splitjoin.vim", branch = "main"})
    use("itmammoth/doorboy.vim")
    use("junegunn/vim-easy-align")
    use("psliwka/vim-smoothie")
    use("svermeulen/vim-cutlass")
    use("zirrostig/vim-schlepp")

    -- Editor Enhancements
    use("hrsh7th/nvim-compe")
    use("kabouzeid/nvim-lspinstall")
    use("neovim/nvim-lspconfig")
    use("nvim-treesitter/nvim-treesitter")

    -- Search & Replace
    use("RRethy/vim-illuminate")
    use("andymass/vim-matchup")

    -- Editor Appearance
    use("Yggdroot/indentLine")
    use("arcticicestudio/nord-vim")
    use("famiu/feline.nvim")
    use("folke/lsp-colors.nvim")
    use("kyazdani42/nvim-web-devicons")
    use("lewis6991/gitsigns.nvim")
    use("mhinz/vim-startify")
    use("norcalli/nvim-colorizer.lua")
    use("romgrk/barbar.nvim")

    -- Support
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")

    -- Syntax & Language Enhancements
    use({"dag/vim-fish",                  ft = "fish"})
    use({"masukomi/vim-markdown-folding", ft = "markdown"})
    use({"tpope/vim-git",                 ft = "gitconfig"})

    -- Overrides
    for _, register in pairs(require.tree("plugins")) do
      if type(register) == "function" then
        register(use)
      end
    end
  end,

  config = {
    compile_path = packer_compile_path,
    display = {
      open_fn = require("packer.util").float
    }
  }
})

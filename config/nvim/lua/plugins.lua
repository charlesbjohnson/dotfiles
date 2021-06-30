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
    use("b3nj5m1n/kommentary")
    use("christoomey/vim-sort-motion")
    use("tpope/vim-repeat")
    use("tpope/vim-surround")
    use("vim-scripts/repmo.vim")

    -- Application Enhancements
    use("aserowy/tmux.nvim")
    use("editorconfig/editorconfig-vim")
    use("folke/trouble.nvim")

    -- Application Features
    use("akinsho/nvim-toggleterm.lua")
    use("kyazdani42/nvim-tree.lua")
    use("mhinz/vim-startify")
    use("nvim-telescope/telescope.nvim")
    use("romgrk/barbar.nvim")
    use("wfxr/minimap.vim")
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})

    -- Editor Enhancements
    use("RRethy/vim-illuminate")
    use("andymass/vim-matchup")
    use("itmammoth/doorboy.vim")
    use("junegunn/vim-easy-align")
    use("psliwka/vim-smoothie")
    use("svermeulen/vim-cutlass")
    use("zirrostig/vim-schlepp")
    use({"AndrewRadev/splitjoin.vim", branch = "main"})

    -- Editor Features
    use("famiu/feline.nvim")
    use("folke/lsp-colors.nvim")
    use("hrsh7th/nvim-compe")
    use("kabouzeid/nvim-lspinstall")
    use("kevinhwang91/nvim-hlslens")
    use("lewis6991/gitsigns.nvim")
    use("neovim/nvim-lspconfig")
    use("nvim-treesitter/nvim-treesitter")
    use("ray-x/lsp_signature.nvim")
    use({"lukas-reineke/indent-blankline.nvim", branch = "lua"})

    -- Editor Appearance
    use("arcticicestudio/nord-vim")
    use("kyazdani42/nvim-web-devicons")
    use("norcalli/nvim-colorizer.lua")

    -- Supporting Libraries
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

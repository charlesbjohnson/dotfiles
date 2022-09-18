local fs = require("fs")
local path = require("path")

local packer_install_path = path.join({ vim.fn.stdpath("data"), "site/pack/packer/opt/packer.nvim" })
local packer_compile_path = path.join({ vim.fn.stdpath("config"), "plugin/packer.lua" })
local packer_snapshot_path = path.join({ vim.fn.stdpath("cache"), "packer.nvim" })

if not fs.exists(packer_install_path) then
  vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", packer_install_path })
end

vim.cmd("packadd packer.nvim")

return require("packer").startup({
  function(use)
    use({ "wbthomason/packer.nvim", opt = true })

    -- Text Objects
    use("fvictorio/vim-textobj-backticks")
    use("kana/vim-textobj-indent")
    use("kana/vim-textobj-line")
    use("kana/vim-textobj-user")

    -- Motions
    use("b3nj5m1n/kommentary")
    use("tpope/vim-repeat")
    use("tpope/vim-surround")
    use("vim-scripts/repmo.vim")

    -- Application Enhancements
    use("aserowy/tmux.nvim")
    use("folke/trouble.nvim")
    use("gpanders/editorconfig.nvim")

    -- Application Features
    use("akinsho/toggleterm.nvim")
    use("goolord/alpha-nvim")
    use("ibhagwan/fzf-lua")
    use("petertriho/nvim-scrollbar")
    use("romgrk/barbar.nvim")
    use({ "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" })

    -- Editor Enhancements
    use("RRethy/vim-illuminate")
    use("andymass/vim-matchup")
    use("antoinemadec/FixCursorHold.nvim")
    use("junegunn/vim-easy-align")
    use("karb94/neoscroll.nvim")
    use("sQVe/sort.nvim")
    use("svermeulen/vim-cutlass")
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")
    use("zirrostig/vim-schlepp")
    use({ "AndrewRadev/splitjoin.vim", branch = "main" })

    -- Editor Features
    use("famiu/feline.nvim")
    use("folke/lsp-colors.nvim")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lsp-signature-help")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-path")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/vim-vsnip")
    use("jose-elias-alvarez/null-ls.nvim")
    use("kevinhwang91/nvim-hlslens")
    use("lewis6991/gitsigns.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("neovim/nvim-lspconfig")
    use("williamboman/mason-lspconfig.nvim")
    use("williamboman/mason.nvim")
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- Editor Appearance
    use("NvChad/nvim-colorizer.lua")
    use("kyazdani42/nvim-web-devicons")
    use("onsails/lspkind.nvim")
    use("shaunsingh/nord.nvim")

    -- Supporting Libraries
    use("MunifTanjim/nui.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")

    -- Syntax & Language Enhancements
    use({ "masukomi/vim-markdown-folding", ft = "markdown" })

    -- Overrides
    for _, register in pairs(require.tree("plugins")) do
      if type(register) == "function" then
        register(use)
      end
    end
  end,

  config = {
    compile_path = packer_compile_path,
    snapshot_path = packer_snapshot_path,
    display = {
      open_fn = require("packer.util").float,
    },
  },
})

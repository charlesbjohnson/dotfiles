-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function("has", { "nvim-0.5" }) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command("packadd packer.nvim")

local no_errors, error_msg = pcall(function()
  _G._packer = _G._packer or {}
  _G._packer.inside_compile = true

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end

  local function save_profiles(threshold)
    local sorted_times = {}
    for chunk_name, time_taken in pairs(profile_info) do
      sorted_times[#sorted_times + 1] = { chunk_name, time_taken }
    end
    table.sort(sorted_times, function(a, b)
      return a[2] > b[2]
    end)
    local results = {}
    for i, elem in ipairs(sorted_times) do
      if not threshold or threshold and elem[2] > threshold then
        results[i] = elem[1] .. " took " .. elem[2] .. "ms"
      end
    end
    if threshold then
      table.insert(results, "(Only showing plugins that took longer than " .. threshold .. " ms " .. "to load)")
    end

    _G._packer.profile_output = results
  end

  time([[Luarocks path setup]], true)
  local package_path_str =
    "/home/charlie/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/charlie/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/charlie/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/charlie/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
  local install_cpath_pattern = "/home/charlie/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
  if not string.find(package.path, package_path_str, 1, true) then
    package.path = package.path .. ";" .. package_path_str
  end

  if not string.find(package.cpath, install_cpath_pattern, 1, true) then
    package.cpath = package.cpath .. ";" .. install_cpath_pattern
  end

  time([[Luarocks path setup]], false)
  time([[try_loadstring definition]], true)
  local function try_loadstring(s, component, name)
    local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
    if not success then
      vim.schedule(function()
        vim.api.nvim_notify(
          "packer.nvim: Error running " .. component .. " for " .. name .. ": " .. result,
          vim.log.levels.ERROR,
          {}
        )
      end)
    end
    return result
  end

  time([[try_loadstring definition]], false)
  time([[Defining packer_plugins]], true)
  _G.packer_plugins = {
    ["FixCursorHold.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
      url = "https://github.com/antoinemadec/FixCursorHold.nvim",
    },
    ["alpha-nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/alpha-nvim",
      url = "https://github.com/goolord/alpha-nvim",
    },
    ["barbar.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/barbar.nvim",
      url = "https://github.com/romgrk/barbar.nvim",
    },
    ["cmp-buffer"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/cmp-buffer",
      url = "https://github.com/hrsh7th/cmp-buffer",
    },
    ["cmp-nvim-lsp"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
      url = "https://github.com/hrsh7th/cmp-nvim-lsp",
    },
    ["cmp-nvim-lsp-signature-help"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
      url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",
    },
    ["cmp-nvim-lua"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
      url = "https://github.com/hrsh7th/cmp-nvim-lua",
    },
    ["cmp-path"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/cmp-path",
      url = "https://github.com/hrsh7th/cmp-path",
    },
    ["feline.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/feline.nvim",
      url = "https://github.com/freddiehaddad/feline.nvim",
    },
    ["fzf-lua"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/fzf-lua",
      url = "https://github.com/ibhagwan/fzf-lua",
    },
    ["gitsigns.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
      url = "https://github.com/lewis6991/gitsigns.nvim",
    },
    ["indent-blankline.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
      url = "https://github.com/lukas-reineke/indent-blankline.nvim",
    },
    kommentary = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/kommentary",
      url = "https://github.com/b3nj5m1n/kommentary",
    },
    ["lsp-colors.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
      url = "https://github.com/folke/lsp-colors.nvim",
    },
    ["lspkind.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
      url = "https://github.com/onsails/lspkind.nvim",
    },
    ["mason-lspconfig.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
      url = "https://github.com/williamboman/mason-lspconfig.nvim",
    },
    ["mason.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/mason.nvim",
      url = "https://github.com/williamboman/mason.nvim",
    },
    ["neo-tree.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
      url = "https://github.com/nvim-neo-tree/neo-tree.nvim",
    },
    ["neoscroll.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
      url = "https://github.com/karb94/neoscroll.nvim",
    },
    ["noice.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/noice.nvim",
      url = "https://github.com/folke/noice.nvim",
    },
    ["nord.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nord.nvim",
      url = "https://github.com/shaunsingh/nord.nvim",
    },
    ["nui.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nui.nvim",
      url = "https://github.com/MunifTanjim/nui.nvim",
    },
    ["null-ls.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
      url = "https://github.com/jose-elias-alvarez/null-ls.nvim",
    },
    ["nvim-autopairs"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
      url = "https://github.com/windwp/nvim-autopairs",
    },
    ["nvim-cmp"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-cmp",
      url = "https://github.com/hrsh7th/nvim-cmp",
    },
    ["nvim-colorizer.lua"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
      url = "https://github.com/NvChad/nvim-colorizer.lua",
    },
    ["nvim-lspconfig"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
      url = "https://github.com/neovim/nvim-lspconfig",
    },
    ["nvim-notify"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-notify",
      url = "https://github.com/rcarriga/nvim-notify",
    },
    ["nvim-scrollbar"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
      url = "https://github.com/petertriho/nvim-scrollbar",
    },
    ["nvim-treesitter"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
      url = "https://github.com/nvim-treesitter/nvim-treesitter",
    },
    ["nvim-ts-autotag"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
      url = "https://github.com/windwp/nvim-ts-autotag",
    },
    ["nvim-web-devicons"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
      url = "https://github.com/kyazdani42/nvim-web-devicons",
    },
    ["packer.nvim"] = {
      loaded = false,
      needs_bufread = false,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/opt/packer.nvim",
      url = "https://github.com/wbthomason/packer.nvim",
    },
    ["plenary.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/plenary.nvim",
      url = "https://github.com/nvim-lua/plenary.nvim",
    },
    ["popup.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/popup.nvim",
      url = "https://github.com/nvim-lua/popup.nvim",
    },
    ["repmo.vim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/repmo.vim",
      url = "https://github.com/vim-scripts/repmo.vim",
    },
    ["sort.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/sort.nvim",
      url = "https://github.com/sQVe/sort.nvim",
    },
    ["tmux.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/tmux.nvim",
      url = "https://github.com/aserowy/tmux.nvim",
    },
    ["toggleterm.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
      url = "https://github.com/akinsho/toggleterm.nvim",
    },
    ["tree-sitter-just"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/tree-sitter-just",
      url = "https://github.com/IndianBoy42/tree-sitter-just",
    },
    treesj = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/treesj",
      url = "https://github.com/Wansmer/treesj",
    },
    ["trouble.nvim"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/trouble.nvim",
      url = "https://github.com/folke/trouble.nvim",
    },
    ["vim-cutlass"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-cutlass",
      url = "https://github.com/svermeulen/vim-cutlass",
    },
    ["vim-easy-align"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-easy-align",
      url = "https://github.com/junegunn/vim-easy-align",
    },
    ["vim-illuminate"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-illuminate",
      url = "https://github.com/RRethy/vim-illuminate",
    },
    ["vim-markdown-folding"] = {
      loaded = false,
      needs_bufread = true,
      only_cond = false,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/opt/vim-markdown-folding",
      url = "https://github.com/masukomi/vim-markdown-folding",
    },
    ["vim-matchup"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-matchup",
      url = "https://github.com/andymass/vim-matchup",
    },
    ["vim-repeat"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-repeat",
      url = "https://github.com/tpope/vim-repeat",
    },
    ["vim-schlepp"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-schlepp",
      url = "https://github.com/zirrostig/vim-schlepp",
    },
    ["vim-surround"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-surround",
      url = "https://github.com/tpope/vim-surround",
    },
    ["vim-textobj-backticks"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-textobj-backticks",
      url = "https://github.com/fvictorio/vim-textobj-backticks",
    },
    ["vim-textobj-indent"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-textobj-indent",
      url = "https://github.com/kana/vim-textobj-indent",
    },
    ["vim-textobj-line"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-textobj-line",
      url = "https://github.com/kana/vim-textobj-line",
    },
    ["vim-textobj-user"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
      url = "https://github.com/kana/vim-textobj-user",
    },
    ["vim-vsnip"] = {
      loaded = true,
      path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-vsnip",
      url = "https://github.com/hrsh7th/vim-vsnip",
    },
  }

  time([[Defining packer_plugins]], false)
  vim.cmd([[augroup packer_load_aucmds]])
  vim.cmd([[au!]])
  -- Filetype lazy-loads
  time([[Defining lazy-load filetype autocommands]], true)
  vim.cmd(
    [[au FileType markdown ++once lua require("packer.load")({'vim-markdown-folding'}, { ft = "markdown" }, _G.packer_plugins)]]
  )
  time([[Defining lazy-load filetype autocommands]], false)
  vim.cmd("augroup END")

  _G._packer.inside_compile = false
  if _G._packer.needs_bufread == true then
    vim.cmd("doautocmd BufRead")
  end
  _G._packer.needs_bufread = false

  if should_profile then
    save_profiles()
  end
end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command(
    'echohl ErrorMsg | echom "Error in packer_compiled: '
      .. error_msg
      .. '" | echom "Please check your config for correctness" | echohl None'
  )
end

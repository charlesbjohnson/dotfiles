" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
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
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/charlie/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/charlie/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/charlie/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/charlie/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/charlie/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["feline.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/feline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["minimap.vim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/minimap.vim"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["pears.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/pears.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["repmo.vim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/repmo.vim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tmux.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/tmux.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-cutlass"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-cutlass"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-fish"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/opt/vim-fish"
  },
  ["vim-git"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/opt/vim-git"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-markdown-folding"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/opt/vim-markdown-folding"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-schlepp"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-schlepp"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-sort-motion"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-sort-motion"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-textobj-backticks"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-textobj-backticks"
  },
  ["vim-textobj-indent"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-textobj-indent"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-textobj-line"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/charlie/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType gitconfig ++once lua require("packer.load")({'vim-git'}, { ft = "gitconfig" }, _G.packer_plugins)]]
vim.cmd [[au FileType fish ++once lua require("packer.load")({'vim-fish'}, { ft = "fish" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-markdown-folding'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/charlie/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]], true)
vim.cmd [[source /home/charlie/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]]
time([[Sourcing ftdetect script at: /home/charlie/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]], false)
time([[Sourcing ftdetect script at: /home/charlie/.local/share/nvim/site/pack/packer/opt/vim-git/ftdetect/git.vim]], true)
vim.cmd [[source /home/charlie/.local/share/nvim/site/pack/packer/opt/vim-git/ftdetect/git.vim]]
time([[Sourcing ftdetect script at: /home/charlie/.local/share/nvim/site/pack/packer/opt/vim-git/ftdetect/git.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry

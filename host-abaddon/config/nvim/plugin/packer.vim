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

time("Luarocks path setup", true)
local package_path_str = "/Users/cbjohnson/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/cbjohnson/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/cbjohnson/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/cbjohnson/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/cbjohnson/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ale = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  ["committia.vim"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/committia.vim"
  },
  ["doorboy.vim"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/doorboy.vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  fzf = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/fzf"
  },
  indentLine = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  ["lightline-bufferline"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/lightline-bufferline"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["rename.vim"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/rename.vim"
  },
  ["repmo.vim"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/repmo.vim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-cutlass"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-cutlass"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-fish"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-fish"
  },
  ["vim-git"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-git"
  },
  ["vim-gitbranch"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-gitbranch"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-javascript"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-javascript"
  },
  ["vim-json"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-json"
  },
  ["vim-markdown-folding"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-markdown-folding"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-sayonara"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-sayonara"
  },
  ["vim-schlepp"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-schlepp"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-smoothie"
  },
  ["vim-sort-motion"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-sort-motion"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-textobj-indent"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-textobj-indent"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-textobj-line"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-tmux-clipboard"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-tmux-clipboard"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-togglelist"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-togglelist"
  },
  ["vim-toml"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-toml"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/Users/cbjohnson/.local/share/nvim/site/pack/packer/start/vim-vinegar"
  }
}

time("Defining packer_plugins", false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time("Defining lazy-load filetype autocommands", true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-markdown-folding'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'vim-javascript'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType fish ++once lua require("packer.load")({'vim-fish'}, { ft = "fish" }, _G.packer_plugins)]]
vim.cmd [[au FileType gitconfig ++once lua require("packer.load")({'vim-git'}, { ft = "gitconfig" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'vim-json'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'vim-toml'}, { ft = "toml" }, _G.packer_plugins)]]
time("Defining lazy-load filetype autocommands", false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time("Sourcing ftdetect script at: /Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-json/ftdetect/json.vim", true)
vim.cmd [[source /Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-json/ftdetect/json.vim]]
time("Sourcing ftdetect script at: /Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-json/ftdetect/json.vim", false)
time("Sourcing ftdetect script at: /Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim", true)
vim.cmd [[source /Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]]
time("Sourcing ftdetect script at: /Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim", false)
time("Sourcing ftdetect script at: /Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-javascript/ftdetect/flow.vim", true)
vim.cmd [[source /Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-javascript/ftdetect/flow.vim]]
time("Sourcing ftdetect script at: /Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-javascript/ftdetect/flow.vim", false)
time("Sourcing ftdetect script at: /Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-javascript/ftdetect/javascript.vim", true)
vim.cmd [[source /Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-javascript/ftdetect/javascript.vim]]
time("Sourcing ftdetect script at: /Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-javascript/ftdetect/javascript.vim", false)
time("Sourcing ftdetect script at: /Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-git/ftdetect/git.vim", true)
vim.cmd [[source /Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-git/ftdetect/git.vim]]
time("Sourcing ftdetect script at: /Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-git/ftdetect/git.vim", false)
time("Sourcing ftdetect script at: /Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim", true)
vim.cmd [[source /Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]]
time("Sourcing ftdetect script at: /Users/cbjohnson/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim", false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry

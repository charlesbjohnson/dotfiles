-- jose-elias-alvarez/null-ls.nvim
require("init.plugins.lsp.null-ls")

-- williamboman/nvim-lsp-installer
local lspinstaller = require("nvim-lsp-installer")

-- TODO https://github.com/williamboman/nvim-lsp-installer/discussions/636
lspinstaller.on_server_ready(function(server)
  local options = {}

  for _, language in ipairs(server.languages) do
    local optfn = require.try(string.join({ "init", "plugins", "lsp", language }, "."))
    if optfn then
      options = optfn()
    end
  end

  server:setup(vim.tbl_deep_extend("force", {}, options, {
    -- hrsh7th/cmp-nvim-lsp
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),

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
end)


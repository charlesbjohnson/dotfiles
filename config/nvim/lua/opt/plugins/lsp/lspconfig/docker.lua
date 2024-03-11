return function(options)
  require("lspconfig").dockerls.setup(options)
  require("lspconfig").docker_compose_language_service.setup(vim.tbl_deep_extend("force", {}, options, {
    filetypes = { "yaml.docker-compose" },
  }))
end

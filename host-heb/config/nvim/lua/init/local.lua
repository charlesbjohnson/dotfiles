vim.filetype.add({
  pattern = {
    ["docker%-compose%.ya?ml"] = "yaml.docker-compose",

    [".*%.tmpl%.ya?ml"] = function()
      if vim.fn.search("{{.\\+}}") then
        return "gotmpl"
      end

      return "yaml"
    end,
  },
})

vim.treesitter.language.register("yaml", "yaml.docker-compose")

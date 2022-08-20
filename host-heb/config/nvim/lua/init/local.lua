vim.filetype.add({
  pattern = {
    [".*%.tmpl%.y[a]?ml$"] = function()
      if vim.fn.search("{{.\\+}}") then
        return "gotmpl"
      end

      return "yaml"
    end,
  },
})

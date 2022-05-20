return function()
  return {
    filetypes = { "html", "eruby.html" },
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
    end,
  }
end

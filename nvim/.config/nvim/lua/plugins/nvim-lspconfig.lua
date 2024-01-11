local util = require("lspconfig.util")

return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      float = {
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    },
    servers = {
      eslint = {},
      volar = {
        filetypes = {
          "typescript",
          "vue",
        },
        root_dir = util.root_pattern("*.vue", "src/*.vue"),
      },
    },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          elseif client.name == "volar" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
}

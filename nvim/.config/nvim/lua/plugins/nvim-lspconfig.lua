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
    inlay_hints = {
      enabled = false,
    },
    servers = {
      eslint = {},
      volar = {},
    },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "vtsls" then
            client.server_capabilities.documentFormattingProvider = false
          elseif client.name == "volar" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
      -- volar = function()
      --   require("lazyvim.util").lsp.on_attach(function(client)
      --     if client.name == "vtsls" then
      --       client.stop(client, false)
      --     end
      --   end)
      -- end,
    },
  },
}

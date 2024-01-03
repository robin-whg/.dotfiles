-- return {
--   "neovim/nvim-lspconfig",
--   opts = function(_, opts)
--     require("lspconfig.ui.windows").default_options = {
--       border = "rounded",
--     }
--     opts.diagnostics.float = {
--       -- focusable = false,
--       style = "minimal",
--       border = "rounded",
--       source = "always",
--       header = "",
--       prefix = "",
--     }
--     opts.servers = { eslint = {} }
--     opts.eslint = function()
--       require("lazyvim.util").lsp.on_attach(function(client)
--         if client.name == "eslint" then
--           client.server_capabilities.documentFormattingProvider = true
--         elseif client.name == "tsserver" then
--           client.server_capabilities.documentFormattingProvider = false
--         elseif client.name == "volar" then
--           client.server_capabilities.documentFormattingProvider = false
--         end
--       end)
--     end
--   end,
-- }
return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      float = {
        -- focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    },
    servers = { eslint = {} },
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

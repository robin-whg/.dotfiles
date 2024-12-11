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
    },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client, bufnr)
          if client.name == "eslint" then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          end
        end)
      end,
    },
  },
}

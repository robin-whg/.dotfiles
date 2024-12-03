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
  },
}

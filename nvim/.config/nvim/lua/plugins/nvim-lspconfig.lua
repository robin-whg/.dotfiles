-- local words = {}
-- for word in io.open(vim.fn.stdpath("config") .. "/spell/en.utf-8.add", "r"):lines() do
--   table.insert(words, word)
-- end
--
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
    -- servers = {
    --   ltex = {
    --     settings = {
    --       ltex = {
    --         language = "de-DE",
    --         disabledRules = {
    --           ["de-DE"] = { "WHITESPACE_RULE" },
    --         },
    --         dictionary = {
    --           ["de-DE"] = words,
    --         },
    --       },
    --     },
    --   },
    -- },
  },
}

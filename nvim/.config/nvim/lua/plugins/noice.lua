return {
  "folke/noice.nvim",
  keys = {
    {
      "<c-u>",
      function()
        if not require("noice.lsp").scroll(4) then
          return "<c-u>"
        end
      end,
      silent = true,
      expr = true,
      desc = "Scroll forward",
      mode = { "i", "n", "s" },
    },
    {
      "<c-d>",
      function()
        if not require("noice.lsp").scroll(-4) then
          return "<c-d>"
        end
      end,
      silent = true,
      expr = true,
      desc = "Scroll backward",
      mode = { "i", "n", "s" },
    },
  },
}

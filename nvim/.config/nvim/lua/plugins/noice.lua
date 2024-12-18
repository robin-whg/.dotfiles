return {
  "folke/noice.nvim",
  keys = {
    {
      "<c-d>",
      function()
        if not require("noice.lsp").scroll(4) then
          return "<c-d>"
        end
      end,
      silent = true,
      expr = true,
      desc = "Scroll forward",
      mode = { "i", "n", "s" },
    },
    {
      "<c-u>",
      function()
        if not require("noice.lsp").scroll(-4) then
          return "<c-u>"
        end
      end,
      silent = true,
      expr = true,
      desc = "Scroll backward",
      mode = { "i", "n", "s" },
    },
  },
  opts = function(_, opts)
    opts.presets.lsp_doc_border = true -- add a border to hover docs and signature help
    table.insert(
      opts.routes,
      { filter = { event = "notify", find = "No information available" }, opts = { skip = true } }
    )
  end,
}

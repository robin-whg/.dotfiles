return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    wk.setup({
      window = {
        border = 'rounded', -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 0, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 0, 0, 1, 0 }, -- extra window padding [top, right, bottom, left]
        winblend = 0
      },
      layout = {
        spacing = 1, -- spacing between columns
        align = "left", -- align columns left, center or right
      },
    })
    wk.register({
      ["<leader>f"] = { name = "Find" },
    })
  end,
}

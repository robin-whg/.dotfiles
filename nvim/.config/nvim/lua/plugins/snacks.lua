return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      border = "rounded",
    },
    notifier = {
      margin = { right = 0 },
    },
    zen = {
      toggles = {
        diagnostics = false,
        inlay_hints = false,
        indent = false,
        wrap = true,
      },
      on_open = function()
        require("blink.cmp").setup({
          enabled = function()
            return false
          end,
        })
      end,
      on_close = function()
        require("blink.cmp").setup({
          enabled = function()
            return true
          end,
        })
      end,
    },
    styles = {
      float = {
        backdrop = 100,
        border = "rounded",
      },
      zen = {
        width = 100,
        border = "none",
        backdrop = { transparent = false, blend = 0 },
        wo = {
          spell = false,
          cursorline = false,
          number = false,
        },
      },
    },
  },
}

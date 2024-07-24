return {
  "b0o/incline.nvim",
  config = function()
    require("incline").setup({
      window = {
        margin = {
          horizontal = 0,
          vertical = 0,
        },
        padding = 0,
      },
    })
  end,
  -- Optional: Lazy load Incline
  event = "VeryLazy",
}

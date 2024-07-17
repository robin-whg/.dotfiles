return {
  "folke/zen-mode.nvim",
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "zen mode" },
  },
  opts = {
    window = {
      backdrop = 1,
      width = 85,
      options = {
        number = false,
        cursorline = false,
        cursorcolumn = false,
        foldcolumn = "0",
      },
    },
    plugins = {
      wezterm = {
        enabled = true,
        font = "+4",
      },
    },
  },
}

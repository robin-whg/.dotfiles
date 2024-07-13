return {
  "folke/zen-mode.nvim",
  keys = {
    { "<leader>Z", "<cmd>ZenMode<cr>", desc = "Find Files (Root Dir)" },
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
      }
    },
    plugins = {
      wezterm = {
        enabled = true,
        font = "+4"
      },
    },
  }
}

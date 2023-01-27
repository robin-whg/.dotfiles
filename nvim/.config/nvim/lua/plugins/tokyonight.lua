return {
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      style = "storm",
      styles = {
        floats = "normal",
        sidebars = "dark"
      }
    })
    vim.cmd.colorscheme "tokyonight"
  end
}

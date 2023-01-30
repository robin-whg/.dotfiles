return {
  "folke/tokyonight.nvim",
  config = function()
    require('tokyonight').setup({
      style = "storm",
      styles = {
        floats = 'normal',
        sidebars = 'normal'
      },
      on_highlights = function(hl, c)
        local prompt = "#00ff00"
        hl.NvimTreeWinSeparator = {
          fg = c.border,
          bg = c.bg_sidebar
        }
      end
    })
    vim.cmd.colorscheme "tokyonight"
  end
}

return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
      styles = {
        sidebars = "normal",
        floats = "normal",
      },
      on_highlights = function(hl, c)
        hl.winbar = {
          bg = c.bg,
        }
        hl.winbarnc = {
          fg = c.fg_dark,
          bg = c.bg,
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}

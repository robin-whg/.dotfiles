return {
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     style = "moon",
  --     styles = {
  --       sidebars = "normal",
  --       floats = "normal",
  --     },
  --     on_highlights = function(hl, c)
  --       hl.winbar = {
  --         bg = c.bg,
  --       }
  --       hl.winbarnc = {
  --         fg = c.fg_dark,
  --         bg = c.bg,
  --       }
  --     end,
  --   },
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = function(_, opts)
      local macchiato = require('catppuccin.palettes').get_palette("macchiato")
      opts.flavour = "macchiato"
      opts.color_overrides = {
        macchiato = {
          -- mantle = macchiato.base
        }
      }
    end
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}

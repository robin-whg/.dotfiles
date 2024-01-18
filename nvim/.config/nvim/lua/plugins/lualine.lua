return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    vim.o.laststatus = vim.g.lualine_laststatus

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = {
          statusline = { "dashboard", "alpha", "starter" },
          winbar = { "dashboard", "alpha", "starter", "neo-tree" },
        },
        separator = "",
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          { "mode", padding = { left = 0, right = 1 } },
          { "branch", icons_enabled = false },
          { "diff", colored = true },
          { "filename" },
          { "diagnostics", colored = true, symbols = { error = "E", warn = "W", info = "I", hint = "H" } },
        },
        lualine_x = {
          { "encoding" },
          { "fileformat", symbols = { unix = "unix", dos = "dos", mac = "mac" } },
          { "filetype", icons_enabled = false },
          { "progress", padding = { left = 1, right = 0 } },
          { "location", padding = { right = 0 } },
        },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}

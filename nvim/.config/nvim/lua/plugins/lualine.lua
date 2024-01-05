return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    vim.o.laststatus = vim.g.lualine_laststatus

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
        separator = "",
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          { "mode" },
          { "branch", icons_enabled = false },
          { "diff", colored = false },
          { "filename" },
          { "diagnostics", colored = false, symbols = { error = "E", warn = "W", info = "I", hint = "H" } },
        },
        lualine_x = {
          { "encoding" },
          { "fileformat", symbols = { unix = "unix", dos = "dos", mac = "mac" } },
          { "filetype", icons_enabled = false },
          { "progress", padding = { left = 1, right = 0 } },
          { "location" },
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

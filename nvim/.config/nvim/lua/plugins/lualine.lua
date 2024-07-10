return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    vim.o.laststatus = vim.g.lualine_laststatus

    local icons = LazyVim.config.icons

    return {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "dashboard", "alpha", "starter" },
          winbar = { "dashboard", "alpha", "starter" },
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {
          { "mode" },
        },
        lualine_b = {
          { "branch", icon = icons.git.branch, separator = { left = "", right = "" } },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
          },
        },
        lualine_c = {
          {
            "filename",
            path = 1,
          },
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
        },
        lualine_x = {
          { "filetype" },
        },
        lualine_y = {
          { "encoding" },
          { "fileformat", symbols = { unix = "unix", dos = "dos", mac = "mac" } },
        },
        lualine_z = {
          { "progress" },
          { "location" },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}

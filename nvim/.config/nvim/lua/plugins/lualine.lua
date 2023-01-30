return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    { "kyazdani42/nvim-web-devicons" }
  },
  config = function()
    local branch = {
      "branch",
      icons_enabled = true,
      icon = "",
    }

    require("lualine").setup({
      options = {
        theme = "tokyonight",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'mode', branch, 'filename', 'diff', 'diagnostics' },

        lualine_x = { 'filetype', 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
    })
  end
}

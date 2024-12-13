return {

  "b0o/incline.nvim",
  config = function()
    require("incline").setup({
      window = {
        margin = {
          horizontal = 0,
          vertical = 0,
        },
        padding = 0,
      },
      render = function(props)
        local devicons = require("nvim-web-devicons")

        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified

        return {
          " ",
          { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
          filename,
          modified and { "+" } or " ",
        }
      end,
    })
  end,
  -- Optional: Lazy load Incline
  event = "VeryLazy",
}

return {
  'b0o/incline.nvim',
  event = "BufReadPre",
  priority = 1200,
  opts = {
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
      local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
      local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "bold"

      local buffer = {
        { ft_icon,  guifg = ft_color }, { " " },
        { filename, gui = modified },
      }
      return buffer
    end,
    window = {
      margin = {
        horizontal = 0,
        vertical = 0
      },
      padding = 0
    }
  }
}

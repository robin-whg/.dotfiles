return {
  "b0o/incline.nvim",
  config = function()
    local devicons = require 'nvim-web-devicons'
    require("incline").setup({
      window = {
        margin = {
          horizontal = 0,
          vertical = 0,
        },
        padding = 0
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')

        return {
          ' ',
          filename,
          ' ',
          guifg = '#82aaff',
          guibg = '#3b4261',
        }
      end,
    })
  end,
  -- Optional: Lazy load Incline
  event = "VeryLazy",
}

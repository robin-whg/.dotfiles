return {
  "telescope.nvim",
  keys = {
    {
      "<C-p>",
      "<cmd>lua require('telescope.builtin').find_files()<cr>",
      silent = true,
    },
  },
  opts = function(_, opts)
    local action = require("telescope.actions")
    opts.defaults = {
      mappings = {
        i = {
          ["<C-k>"] = action.move_selection_previous,
          ["<C-j>"] = action.move_selection_next,
          ["<C-e>"] = action.close,
        },
        n = {
          ["<C-e>"] = action.close,
        },
      },
    }
  end,
}

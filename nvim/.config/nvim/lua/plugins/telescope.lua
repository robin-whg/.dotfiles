return {
  "telescope.nvim",
  opts = function(_, opts)
    local action = require("telescope.actions")
    opts.defaults = {
      mappings = {
        i = {
          ["<C-k>"] = action.move_selection_previous,
          ["<C-j>"] = action.move_selection_next,
          ["<C-e>"] = action.close,
        },
      },
    }
  end,
}

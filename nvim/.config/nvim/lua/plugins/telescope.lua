return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" }
  },
  cmd = "Telescope",
  keys = {
    { "<C-p>", "<cmd>Telescope git_files<cr>" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
  },
  config = function()
    local actions = require("telescope.actions")
    require("telescope").setup({
      defaults = {

        path_display = { "smart" },

        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            ["<C-c>"] = actions.close,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
          },

          n = {
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["?"] = actions.which_key,
          },
        },
      },
      pickers = {
        git_files = {
          theme = "dropdown",
          previewer = false,
        },
      },
    })
  end
}

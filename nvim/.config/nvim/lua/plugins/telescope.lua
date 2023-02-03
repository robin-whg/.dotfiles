return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	cmd = "Telescope",
	keys = {
		{ "<C-p>", "<cmd>Telescope git_files<cr>" },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find file" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep file" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffer" },

		{ "<leader>;", "<cmd>Telescope command_history<cr>", desc = "Command history" },
		{ "<leader>:", "<cmd>Telescope commands<cr>", desc = "Find command" },

		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help" },
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find keymap" },
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
	end,
}

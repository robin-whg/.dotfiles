return {
	"folke/trouble.nvim",
	dependencies = {
		{ "kyazdani42/nvim-web-devicons" },
	},
	config = function()
		local icons = require("config.icons")
		require("trouble").setup({
			height = 32,
			signs = {
				error = icons.diagnostics.error,
				warning = icons.diagnostics.warning,
				hint = icons.diagnostics.hint,
				information = icons.diagnostics.info,
			},
			action_keys = {
				{ "<leader>t", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Trouble" },
			},
		})
	end,
}

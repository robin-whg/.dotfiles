return {
	"folke/trouble.nvim",
	dependencies = {
		{ "kyazdani42/nvim-web-devicons" },
	},
	keys = {
		{ "<leader>d", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Diagnostics" },
	},
	config = function()
		local icons = require("config.icons")
		require("trouble").setup({
			height = 16,
			signs = {
				error = icons.diagnostics.error,
				warning = icons.diagnostics.warning,
				hint = icons.diagnostics.hint,
				information = icons.diagnostics.info,
			},
		})
	end,
}

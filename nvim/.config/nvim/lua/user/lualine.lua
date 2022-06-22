local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local icons = require("user.icons")

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint" },
	symbols = {
		error = icons.diagnostics.Error .. " ",
		warn = icons.diagnostics.Warning .. " ",
		info = icons.diagnostics.Info .. " ",
		hint = icons.diagnostics.Hint .. " ",
	},
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			"mode",
			branch,
			diagnostics,
		},
		lualine_x = {
			"filename",
			"encoding",
			"filetype",
			"location",
			"%L",
		},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})

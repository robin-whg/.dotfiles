local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local diff = {
	"diff",
	colored = false,
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
			diff,
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

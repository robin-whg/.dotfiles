local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info" },
	symbols = { error = " ", warn = " ", info = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = "", modified = "", removed = "" }, -- changes diff symbols
	cond = hide_in_width,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	-- options = {
	--   globalstatus = true,
	--   icons_enabled = true,
	--   theme = "auto",
	--   component_separators = { left = "", right = "" },
	--   section_separators = { left = "", right = "" },
	--   disabled_filetypes = { "alpha", "dashboard" },
	--   always_divide_middle = true,
	-- },
	-- sections = {
	--   lualine_a = { "mode" },
	--   lualine_b = {branch},
	--   lualine_c = { diagnostics },
	--   lualine_x = {  "require'lsp-status'.status()", diff, spaces, "encoding", filetype },
	--   lualine_y = { location },
	--   lualine_z = { "progress" },
	-- },
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
			{
				function()
					local msg = "No Lsp"
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return msg
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return client.name
						end
					end
					return msg
				end,
				icons_enabled = false,
				icon = " LSP:",
			},
			"encoding",
			"filetype",
			"location",
			"%L",
		},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})

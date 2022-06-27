local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local icons = require("user.icons")

local lsp = {
	function()
		-- msg = msg or "LS Inactive"
		local buf_clients = vim.lsp.buf_get_clients()
		if next(buf_clients) == nil then
			-- TODO: clean up this if statement
			-- if type(msg) == "boolean" or #msg == 0 then
			return "LS Inactive"
			-- end
			-- return msg
		end
		-- local buf_ft = vim.bo.filetype
		local buf_client_names = {}

		-- add client
		for _, client in pairs(buf_clients) do
			if client.name ~= "null-ls" then
				table.insert(buf_client_names, client.name)
			end
		end

		local unique_client_names = vim.fn.uniq(buf_client_names)
		return " " .. table.concat(unique_client_names, ", ")
	end,
	color = { gui = "bold" },
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = {
		error = icons.diagnostics.Error .. " ",
		warn = icons.diagnostics.Warning .. " ",
		-- info = icons.diagnostics.Info .. " ",
		-- hint = icons.diagnostics.Hint .. " ",
	},
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = " ",
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
		lualine_b = {
			"mode",
		},
		lualine_c = {
			branch,
			"filename",
		},
		lualine_x = {
			diagnostics,
			lsp,
			"filetype",
			-- "encoding",
			"location",
			"%L",
		},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})

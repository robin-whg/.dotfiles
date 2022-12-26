local colorscheme = "catppuccin"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_dark_sidebar = false
-- vim.g.tokyonight_dark_float = false

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

local catppuccin_status_ok, catppuccin = pcall(require, "catppuccin")

catppuccin.setup({
  flavour = "macchiato",
  background = {
    dark = "macchiato"
  },
  integrations = {
    cmp = true,
    nvimtree = true,
    telescope = true
  }
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

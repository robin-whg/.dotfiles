local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
	return
end

whichkey.setup({
	window = {
		border = "rounded",
	},
})

whichkey.register({
	f = { "find" },
	e = { "explorer" },
}, { prefix = "<leader>" })

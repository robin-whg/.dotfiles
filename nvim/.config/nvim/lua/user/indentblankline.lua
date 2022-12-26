local status_ok, indentblankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

indentblankline.setup({
  enabled = true,
	show_current_context = true,
  colored_indent_levels = false,
})

local status_ok, nvimcolorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

nvimcolorizer.setup {
  '*'; -- Highlight all files, but customize some others.
  css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
}

return {
  "catppuccin/nvim",
  as = "catppuccin",
  config = function()
    require('catppuccin').setup({
      flavour = "macchiato",
      integrations = {
        nvimtree = true
      }
    })
    -- vim.cmd.colorscheme "catppuccin"
  end
}

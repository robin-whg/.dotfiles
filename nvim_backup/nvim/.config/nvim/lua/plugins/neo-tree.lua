return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    popup_border_style = "rounded",
    enable_git_status = false,
    enable_diagnostics = false,
    enable_modified = false,
    window = {
      width = 32,
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        never_show = {
          ".git",
          ".DS_Store",
        },
      },
    },
  },
}

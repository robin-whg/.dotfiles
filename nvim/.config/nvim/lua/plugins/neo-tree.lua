return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    popup_border_style = "rounded",
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
          ".obsidian",
          ".markdownlint.json",
          ".obsidian.vimrc",
        },
      },
    },
  },
}

return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  config = function()
    require("Comment").setup({
      toggler = {
        ---Line-comment toggle keymap
        line = '<C-_>',
      },
      opleader = {
        ---Line-comment keymap
        line = '<C-_>',
      },
    })
  end
}

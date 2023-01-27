return {
  "nvim-treesitter/nvim-treesitter",
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { "c", "lua", "vim", "python", "javascript", "typescript", "go", "rust" },
      highlight = {
        enabled = true
      }
    })
  end
}

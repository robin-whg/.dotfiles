return {
  "nvim-treesitter/nvim-treesitter",
  build = ':TSUpdate',
  event = "BufReadPost",
  config = function()
    require('nvim-treesitter.configs').setup({
      highlight = { enable = true },
      indent = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = {
        "bash",
        "help",
        "html",
        "css",
        "javascript",
        "json",
        "json5",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "typescript",
        "go",
        "rust",
        "vim",
        "yaml",
      },
    })
  end
}

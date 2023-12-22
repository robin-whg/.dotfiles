return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "marksman",
      "emmet-language-server",
      "vue-language-server",
    })
  end,
}

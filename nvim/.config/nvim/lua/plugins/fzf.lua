return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<C-f>", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
  },
  opts = function(_, opts)
    local config = require("fzf-lua.config")
    config.defaults.keymap.fzf["ctrl-e"] = "abort"
    opts.winopts.backdrop = 100
  end,
}

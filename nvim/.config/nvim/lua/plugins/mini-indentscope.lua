return {
  "echasnovski/mini.indentscope",
  opts = function(_, opts)
    opts.draw = {
      animation = require("mini.indentscope").gen_animation.none(),
    }
    opts.symbol = "╎"
  end,
}

if true then
  return {}
end

return {
  "b0o/incline.nvim",
  config = function()
    require("incline").setup({
      window = {
        margin = {
          horizontal = 0,
          vertical = 0,
        },
      },
    })
  end,
}

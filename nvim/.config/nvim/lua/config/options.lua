-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.relativenumber = false
opt.list = false
opt.conceallevel = 0
opt.cmdheight = 2
opt.scrolloff = 8
opt.spelllang = { "en_us", "de_de" }
opt.winbar = "%=%t%m%="
opt.smartindent = true

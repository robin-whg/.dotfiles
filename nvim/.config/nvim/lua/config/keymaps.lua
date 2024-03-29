-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jk", "<esc>", { silent = true }) -- jk to escape
map({ "n", "v" }, ";", ":", { silent = true }) -- easier to type :
map("n", "<C-q>", "<cmd>qa<cr>", { silent = true }) -- quit all buffers
map("n", "<S-l>", "$", { silent = true }) -- move to end of line
map("n", "<S-h>", "^", { silent = true }) -- move to beginning of line
map("n", "x", '"_x', { silent = true }) -- don't yank chars deleted with x
map("n", "<A-p>", '"0p', { silent = true }) -- Paste last thing yanked, not deleted
map("n", "Y", "yg$", { silent = true }) -- Y to behave like D and C
-- Leader
map("n", "<leader>l", "<cmd>e #<cr>", { desc = "Last Buffer" })
map("n", "<leader>p", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<leader>n", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- TODO: Add replace keymaps

local del = vim.keymap.del

-- Disable terminal binds
del("n", "<C-_>")
del("n", "<c-/>")
del("n", "<leader>ft")
del("n", "<leader>fT")

-- vim-tmux-navigator
map({ "i", "n", "v" }, "<C-k>", "<cmd>TmuxNavigateUp<cr><esc>", { desc = "Move cursor to top pane" })
map({ "i", "n", "v" }, "<C-j>", "<cmd>TmuxNavigateDown<cr><esc>", { desc = "Move cursor to bottom pane" })
map({ "i", "n", "v" }, "<C-h>", "<cmd>TmuxNavigateLeft<cr><esc>", { desc = "Move cursor to left pane" })
map({ "i", "n", "v" }, "<C-l>", "<cmd>TmuxNavigateRight<cr><esc>", { desc = "Move cursor to right pane" })
map({ "i", "n", "v" }, "<C-\\>", "<cmd>TmuxNavigatePrevious<cr><esc>", { desc = "Move cursor to previous pane" })

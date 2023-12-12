-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Press jk to exit
map("i", "jk", "<ESC>", { expr = true, silent = true })

-- Easier command mode
map({ "n", "v" }, ";", ":", { expr = true, silent = true })

-- Quit all
map("n", "<C-q>", "<cmd>qa<cr>", { desc = "Quit all" })

-- don't yank chars deleted with x
map("n", "x", '"_x', { expr = true, silent = true })

-- Paste last thing yanked - not deleted
map("n", "<alt-p>", '"0p', { expr = true, silent = true, desc = "Paste last thing yanked - not deleted" })

-- Yank to end of line
map("n", "Y", "yg$", { expr = true, silent = true, desc = "Yank to end of line" })

-- TODO easier rename/replace
-- keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace current word" })
-- rename symbol
-- replace word

-- buffer navigation
map("n", "<C-n>", "<C-^>", { expr = true, silent = true })

map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make file executable", expr = true })

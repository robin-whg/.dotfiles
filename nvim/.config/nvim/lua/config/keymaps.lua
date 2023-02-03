--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Shorten function name
local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }

-- Normal Mode --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "J", "mzJ`z", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Handle paragraphs better
keymap("n", "k", "gk", opts)
keymap("n", "j", "gj", opts)
-- Easier command mode
keymap("n", ";", ":", opts)
-- Buffer Navigation
keymap("n", "<C-n>", "<C-^>", opts)
keymap("n", "Tab", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
-- Standard save
keymap("n", "<C-s>", ":w<CR>", opts)
-- Quit
keymap("n", "<C-q>", ":q<CR>", opts)
keymap("n", "<C-Q>", ":q!<CR>", opts)
-- don't yank chars deleted with x
keymap("n", "x", '"_x', opts)
-- Paste last thing yanked, not deleted
keymap("n", "<alt-p>", '"0p', opts)
-- Y to behave like D and C
keymap("n", "Y", "yg$", opts)
-- Easier $ and ^
keymap("n", "L", "$", opts) -- overwrites go to last visible line
keymap("n", "H", "^", opts) -- overwrites go to first visible line

keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace current word" })
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make executable", noremap = true })

-- Insert --
-- Press jk fast to exit
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in visual mode on indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Move text up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
-- Paste without yanking
keymap("v", "p", '"_dP', opts)
-- Delete without yanking
keymap("v", "<leader>d", '"_d')

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

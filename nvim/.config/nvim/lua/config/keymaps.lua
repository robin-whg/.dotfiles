local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal Mode --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Handle paragraphs better
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", opts)
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", opts)
-- Easier command mode
keymap("n", ";", ":", opts)
-- Buffer Navigation
keymap("n", "Tab", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
-- keymap("n", "<C-b>", "<C-^>", opts) -- overwrites go up one page
-- TODO: rebind jumpmap
-- Standard save
keymap("n", "<C-s>", ":w<CR>", opts)
-- Close buffer
keymap("n", "<C-x>", ":bd<CR>", opts) -- overwrites decrement; increment <C-a> is tmux prefix.
-- Quit
keymap("n", "<C-q>", ":q<CR>", opts)
keymap("n", "<C-Q>", ":q!<CR>", opts)
-- don't yank chars deleted with x
keymap("n", "x", '"_x', opts)
-- Y to behave like D and C
keymap("n", "Y", "yg$", opts)
-- Paste last thing yanked, not deleted
keymap("n", "<alt-p>", '"0p', opts)
-- Easier $ and ^
keymap("n", "L", "$", opts) -- overwrites go to last visible line
keymap("n", "H", "^", opts) -- overwrites go to first visible line

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
-- Paste without yanking selection
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
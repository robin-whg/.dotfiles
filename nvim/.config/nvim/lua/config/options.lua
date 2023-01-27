-- enable break indent
vim.opt.breakindent = true
-- create a backup file
vim.opt.backup = false
-- allows neovim to access the system clipboard
vim.opt.clipboard = "unnamedplus"
-- more space in the neovim command line for displaying messages
vim.opt.cmdheight = 2
-- mostly just for cmp
vim.opt.completeopt = { "menuone", "noselect" }
-- so that `` is visible in markdown files
vim.opt.conceallevel = 0
-- the encoding written to a file
vim.opt.fileencoding = "utf-8"
-- highlight all matches on previous search pattern
vim.opt.hlsearch = false
-- ignore case in search patterns
vim.opt.ignorecase = true
-- allow the mouse to be used in neovim
vim.opt.mouse = "a"
-- pop up menu height
vim.opt.pumheight = 8
-- smart case
vim.opt.smartcase = true
-- make indenting smarter again
vim.opt.smartindent = true
-- force all horizontal splits to go below current window
vim.opt.splitbelow = true
-- force all vertical splits to go to the right of current window
vim.opt.splitright = true
-- creates a swapfile
vim.opt.swapfile = false
-- set term gui colors (most terminals support this)
vim.opt.termguicolors = true
-- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.timeoutlen = 500
-- enable persistent undo
vim.opt.undofile = true
-- faster completion (4000ms default)
vim.opt.updatetime = 250
-- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.writebackup = false
-- convert tabs to spaces
vim.opt.expandtab = true
-- the number of spaces inserted for each indentation
vim.opt.shiftwidth = 2
-- insert 2 spaces for a tab
vim.opt.tabstop = 2
-- highlight the current line
vim.opt.cursorline = true
-- set numbered lines
vim.opt.number = true
-- always show the sign column, otherwise it would shift the text each time
vim.opt.signcolumn = "yes"
-- display lines as one long line
vim.opt.wrap = false
-- min number of lines above and below cursorline
vim.opt.scrolloff = 8
-- same for horizontal
vim.opt.sidescrolloff = 8
-- tell vim the background is dark
vim.opt.background = "dark"
-- correct working directory
vim.opt.autochdir = true
-- auto resize tabs
vim.opt.equalalways = true
-- tabs always have same length
vim.opt.smarttab = true
-- good auto indent
vim.opt.autoindent = true
-- we don't need to see things like -- INSERT -- anymore
vim.opt.showmode = false
-- always display statusline
vim.opt.laststatus = 2
-- don't give `ins-completion-menu` messages.
vim.opt.shortmess:append("c") -- don't shorten messages

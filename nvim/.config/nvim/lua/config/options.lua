local options = {
  -- enable break indent
  breakindent = true,
  -- create a backup file
	backup = false,
  -- allows neovim to access the system clipboard
	clipboard = "unnamedplus",
  -- more space in the neovim command line for displaying messages
	cmdheight = 2,
  -- mostly just for cmp
	completeopt = { "menuone", "noselect" },
  -- so that `` is visible in markdown files
	conceallevel = 0,
  -- the encoding written to a file
	fileencoding = "utf-8",
  -- highlight all matches on previous search pattern
	hlsearch = false, 
  -- ignore case in search patterns
	ignorecase = true,
  -- allow the mouse to be used in neovim
	mouse = "a",
  -- pop up menu height
	pumheight = 8,
  -- smart case
	smartcase = true,
  -- make indenting smarter again
	smartindent = true,
  -- force all horizontal splits to go below current window
	splitbelow = true,
  -- force all vertical splits to go to the right of current window
	splitright = true,
  -- creates a swapfile
	swapfile = false,
  -- set term gui colors (most terminals support this)
	termguicolors = true, 
  -- time to wait for a mapped sequence to complete (in milliseconds)
	timeoutlen = 500,
  -- enable persistent undo
	undofile = true,
  -- faster completion (4000ms default)
	updatetime = 250,
  -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	writebackup = false,
  -- convert tabs to spaces
	expandtab = true,
  -- the number of spaces inserted for each indentation
	shiftwidth = 2, 
  -- insert 2 spaces for a tab
	tabstop = 2,
  -- highlight the current line
	cursorline = true, 
  -- set numbered lines
	number = true, 
  -- always show the sign column, otherwise it would shift the text each time
	signcolumn = "yes", 
  -- display lines as one long line
	wrap = false,
  -- min number of lines above and below cursorline
	scrolloff = 8,
  -- same for horizontal
	sidescrolloff = 8,
  -- tell vim the background is dark
	background = "dark",
  -- correct working directory
	autochdir = true,
  -- auto resize tabs
	equalalways = true,
  -- tabs always have same length
	smarttab = true,
  -- good auto indent
	autoindent = true,
  -- we don't need to see things like -- INSERT -- anymore
	showmode = false, 
  -- always display statusline
	laststatus = 2,
}

-- don't give `ins-completion-menu` messages.
vim.opt.shortmess:append("c") -- don't shorten messages

for k, v in pairs(options) do
	vim.opt[k] = v
end

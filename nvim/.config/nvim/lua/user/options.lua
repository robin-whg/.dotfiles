local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 2, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = false, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 8, -- min number of lines above and below cursorline
  sidescrolloff = 8, -- same for horizontal
  -- background = "dark", -- tell vim the background is dark
  autochdir = true, -- correct working directory
  equalalways = true, -- auto resize tabs
  smarttab = true, -- tabs always have same length
  autoindent = true, -- good auto indent
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  laststatus = 2, -- always display statusline
  -- showtabline = 2, -- always show tabs
}

vim.opt.shortmess:append("c") -- don't shorten messages
-- vim.cmd [[FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]] -- not working
vim.cmd [[let g:netrw_banner=0]]
-- vim.opt.whichwrap:append("<,>,[,],h,l")
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})

for k, v in pairs(options) do
  vim.opt[k] = v
end


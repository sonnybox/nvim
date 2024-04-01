-- set leader as space
vim.g.mapleader = ' '

-- lsp keymaps
require('general.lsp-keymaps')

-- change tilde symbol to something better (none lol)
vim.opt.fillchars = { eob = ' ' }

-- terminal stuff
vim.keymap.set('t', '<esc>', '<c-\\><c-n>',  { noremap = true })
vim.keymap.set('n', '<leader>j', ':ToggleTerm<CR>', { noremap = true })

-- file explorer
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })

-- hide mode as we are using lualine
vim.o.showmode = false

-- make the cmdheight 0 on startup
vim.o.cmdheight = 0

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- disable mouse
vim.o.mouse = ''

-- fix yank
vim.o.clipboard = "unnamedplus"

-- enable numbered lines
vim.o.number = true

-- the number of spaces to use for each step of indent
vim.o.shiftwidth = 4

-- the number of spaces that a tab counts for
vim.o.tabstop = 4

-- convert tabs to spaces 
vim.o.expandtab = true

-- disable line wrap
vim.o.wrap = false

-- enable file history (undo)
vim.o.undofile = true

-- number of changes logged in undo history
vim.o.undolevels = 1024

-- change end of line behavior for arrow keys
vim.o.whichwrap = '<,>,[,]'

-- Diagnostic settings
vim.diagnostic.config {
	virtual_text = true,
	signs = false,
	underline = true,
}

-- Disable highlighting on search
vim.o.hlsearch = false

-- Disable swap file
vim.o.swapfile = false

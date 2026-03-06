vim.g.mapleader = ' ' -- set the leader key as space

--- relative imports
require('native.statusline')
require('native.toggle_checkbox')
require('native.toggle_wrap')
require('native.toggle_numbers')
require('native.hover')
require('native.cursor')
require('native.copypaste')

vim.opt.termguicolors = true -- enable true color support
-- vim.opt.mouse = '' -- disable mouse
vim.opt.scrolloff = 999 -- add a scroll offset
vim.opt.hlsearch = false -- disable highlight after search
vim.opt.cursorline = true -- enable cursor line highlighting
vim.opt.cursorlineopt = 'both' -- cursor line highlight options
vim.opt.showmode = false -- hide mode if you are a custom statusline
-- vim.opt.cmdheight = 0 -- set the command height
vim.opt.incsearch = true -- highlight matching partial searches
vim.opt.updatetime = 333 -- increase update time
vim.opt.timeoutlen = 1000 -- keymap timeout time
vim.opt.ignorecase = true -- ignore case in various places
vim.opt.smartcase = true -- if ignorecase results in only uppercase results
local indent = 4 -- the number of characters for indenting
vim.opt.shiftwidth = indent -- number of spaces for indenting
vim.opt.tabstop = indent -- number of spaces tab counts for
vim.opt.softtabstop = indent -- number of spaces during editing operations
vim.opt.expandtab = true -- converts tab to spaces
vim.opt.smartindent = true -- do smart indenting on a new line
-- vim.opt.signcolumn = "yes" -- always adds a signcolumn
vim.opt.winborder = 'rounded' -- adds a nice border to popups

-- set leader as space
vim.g.mapleader = ' '

-- keep one extra col on by default
vim.opt.signcolumn = 'yes'

-- minimalize the gutter (it will auto grow)
vim.opt.numberwidth = 1

-- change tilde symbol to something better (none lol)
vim.opt.fillchars = { eob = ' ' }

-- hide mode as we are using lualine
vim.opt.showmode = false

-- make the cmdheight 1 on startup
vim.opt.cmdheight = 1

-- enable mouse
vim.opt.mouse = nil

-- add a scroll offset
vim.opt.scrolloff = 10

-- fix yank
vim.opt.clipboard = 'unnamedplus'

-- enable numbered lines
vim.opt.number = true

-- the number of characters for indenting
local indent = 4
vim.opt.shiftwidth = indent
vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.autoindent = true

-- enable line wrap by default
vim.opt.wrap = true

-- disable highlight stuck on after search
vim.opt.hlsearch = false

-- highlight matching partial searches
vim.opt.incsearch = false

-- increase update time
vim.opt.updatetime = 333

-- keymap timeout time
vim.opt.timeoutlen = 1000

-- autocommands
require('general.autocommands')

-- main keymaps
require('general.keymaps')

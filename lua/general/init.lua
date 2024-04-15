-- set leader as space
vim.g.mapleader = ' '

-- idk prime has it
vim.g.have_nerd_font = true

-- enable break indent
vim.o.breakindent = true

-- keep one extra col on by default
-- vim.o.signcolumn = 'yes'

-- should be in copilot section but stuff happens
vim.g.copilot_no_tab_map = true

-- minimalize the gutter (it will auto grow)
vim.o.numberwidth = 1

-- maybe fix tsx indent
vim.o.smartindent = false

-- change tilde symbol to something better (none lol)
vim.opt.fillchars = { eob = ' ' }

-- hide mode as we are using lualine
vim.o.showmode = false

-- make the cmdheight 1 on startup
vim.o.cmdheight = 1

-- enable mouse
vim.o.mouse = 'a'

-- mouse scroll multiplier
vim.o.mousescroll = 'ver:5'

-- add a scroll offset
vim.o.scrolloff = 30

-- fix yank
vim.o.clipboard = 'unnamedplus'

-- enable numbered lines
vim.o.number = true

-- soft tab stop
vim.o.softtabstop = 4

-- the number of spaces to use for each step of indent
vim.o.shiftwidth = 4

-- the number of spaces that a tab counts for
vim.o.tabstop = 4

-- convert tabs to spaces
vim.o.expandtab = true

-- enable line wrap by default
vim.o.wrap = true

-- change end of line behavior for arrow keys
vim.o.whichwrap = '<,>,[,]'

-- Disable highlighting on search
vim.o.hlsearch = false

-- idk prime has this
vim.o.incsearch = true

-- increase update time
vim.o.updatetime = 400

-- keymap timeout time
vim.o.timeoutlen = 400

-- autocommands
require('general.autocommands')

-- main keymaps
require('general.keymaps')

--[ [ ------ ] ]--
-- *  Leader  * --
--] ] ------ ] ]--

vim.g.mapleader = ' ' -- set leader as space

--[ [ ------ ] ]--
-- *  Visual  * --
--] ] ------ ] ]--

vim.opt.signcolumn = 'auto' -- dynamically adjust sign column
vim.opt.cursorline = true -- enable cursor line highlighting
vim.opt.cursorlineopt = 'both' -- cursor line options
vim.opt.fillchars = { eob = ' ' } -- change tilde symbol to something better (none lol)
vim.opt.showmode = false -- hide mode as we are using lualine
vim.opt.cmdheight = 1 -- set the command height

--[ [ ----- ] ]--
-- *  Misc.  * --
--] ] ----- ] ]--

vim.opt.incsearch = false -- highlight matching partial searches
vim.opt.updatetime = 333 -- increase update time
vim.opt.timeoutlen = 1000 -- keymap timeout time
vim.opt.mouse = '' -- disable mouse
vim.opt.scrolloff = 5 -- add a scroll offset
vim.opt.clipboard = 'unnamedplus' -- yank to clipboard
vim.opt.number = true -- enable numbered lines
vim.opt.whichwrap:append('<>[]hl') -- change arrow key wrap behavior
vim.opt.wrap = false -- disable line wrap by default
vim.opt.hlsearch = false -- disable highlight stuck on after search
vim.opt.ignorecase = true -- ignore case in various places
vim.opt.smartcase = true -- if ignorecase results in only uppercase results
vim.opt.termguicolors = true -- enable true color support

--[ [ --------- ] ]--
-- *  Indenting  * --
--] ] --------- ] ]--

local indent = 4 -- the number of characters for indenting
vim.opt.shiftwidth = indent -- number of spaces for indenting
vim.opt.tabstop = indent -- number of spaces tab counts for
vim.opt.softtabstop = indent -- number of spaces during editing operations
vim.opt.expandtab = true -- converts tab to spaces
vim.opt.smartindent = true -- do smart indenting on a new line

--[ [ --------- ] ]--
-- *  More Conf  * --
--] ] --------- ] ]--

require('general.keymaps') -- extra keymaps

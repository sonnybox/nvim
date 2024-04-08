-- Ensure a undo directory exists
local undos_dir = os.getenv('HOME') .. '/.nvim-undo'
if not vim.loop.fs_stat(undos_dir) then vim.loop.fs_mkdir(undos_dir, 493) end

-- Neovim file management
vim.o.undodir = undos_dir
vim.o.undofile = true
vim.o.undolevels = 1024
vim.o.swapfile = false

-- Ensure Lazy is installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Additional configurations
require('general')
require('lazy').setup({ import = 'plugins' })

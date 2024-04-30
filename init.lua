-- Ensure a undo directory exists
-- The 493 is the octal representation of 755 permissions
local undos_dir = os.getenv('HOME') .. '/.nvim-undo'
if not vim.loop.fs_stat(undos_dir) then vim.loop.fs_mkdir(undos_dir, 493) end

-- Neovim file management
vim.opt.undodir = undos_dir
vim.opt.undofile = true
vim.opt.undolevels = 1024
vim.opt.swapfile = false

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
local ok, err

ok, err = pcall(require, 'general')
if not ok then
	vim.notify('Error loading general: ' .. err, vim.log.levels.ERROR)
end

ok, err = pcall(require('lazy').setup, { import = 'plugins' })
if not ok then
	vim.notify('Error setting up lazy.nvim: ' .. err, vim.log.levels.ERROR)
end

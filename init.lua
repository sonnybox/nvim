-- Ensure a undo directory exists
local undos_dir = os.getenv('HOME') .. '/.nvim-undo'
if not vim.uv.fs_stat(undos_dir) then vim.uv.fs_mkdir(undos_dir, 493) end

-- Neovim file management
vim.opt.undodir = undos_dir
vim.opt.undofile = true
vim.opt.undolevels = 1024
vim.opt.swapfile = false

-- Ensure Lazy is installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

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

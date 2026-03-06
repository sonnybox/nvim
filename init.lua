-- Ensure a undo directory exists
local undos_dir = os.getenv('HOME') .. '/.nvim-undo'
if not vim.uv.fs_stat(undos_dir) then vim.uv.fs_mkdir(undos_dir, 493) end

-- Neovim file management
vim.opt.undodir = undos_dir
vim.opt.undofile = true
vim.opt.undolevels = 1024
vim.opt.swapfile = false

-- Setup clipboard when ssh'ed
if not vim.fn.getenv('DISPLAY') then
	print('active')
	vim.g.clipboard = {
		name = 'OSC 52',
		copy = {
			['+'] = require('vim.ui.clipboard.osc52').copy('+'),
			['*'] = require('vim.ui.clipboard.osc52').copy('*'),
		},
		paste = {
			['+'] = function()
				return {
					vim.fn.split(vim.fn.getreg(''), '\n'),
					vim.fn.getregtype(''),
				}
			end,
			['*'] = function()
				return {
					vim.fn.split(vim.fn.getreg(''), '\n'),
					vim.fn.getregtype(''),
				}
			end,
		},
	}
end

-- My native settings
require('native')

-- Lazy plugin manager
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

require('lazy').setup({
	spec = {
		{ import = 'plugins' },
	},
	-- don't auto-check for plugin updates
	checker = { enabled = false },
	-- disable change detection
	change_detection = { enabled = false },
	rocks = { enabled = false },
})

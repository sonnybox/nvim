local config = function()
	local map = vim.api.nvim_set_keymap
	local opts = { noremap = true, silent = true }

	-- window bindings
	map('n', '<A-Tab>', '<Cmd>BufferNext<CR>', opts)
	map('n', '<A-S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
	map('n', '<A-w>', '<Cmd>BufferClose!<CR>', opts)
	map('n', '<A-s>', '<Cmd>w<CR>', opts)
	map('n', '<A-q>', '<Cmd>qa!<CR>', opts)
	map('n', '<A-t>', '<Cmd>enew<CR>', opts)

	require('barbar').setup({
		animation = true,
		highlight_alternate = true,
		highlight_visible = true,
		no_name_title = 'Untitled',
	})
end

return {
	'romgrk/barbar.nvim',
	dependencies = {
		'lewis6991/gitsigns.nvim',
		'nvim-tree/nvim-web-devicons',
	},
	config = config,
	version = '^1.0.0', -- optional: only update when a new 1.x version is released
}

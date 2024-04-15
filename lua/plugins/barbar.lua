local config = function()
	local map = vim.api.nvim_set_keymap
	local opts = { noremap = true, silent = true }

	-- Window bindings
	map('n', '<C-Tab>', '<Cmd>BufferPrevious<CR>', opts)
	map('n', '<C-S-Tab>', '<Cmd>BufferNext<CR>', opts)
	map('n', '<C-w>', '<Cmd>wq<CR>', opts)
	map('n', '<C-q>', '<Cmd>qa!<CR>', opts)

	require('barbar').setup({
		auto_hide = 1,
		sidebar_filetypes = {
			NvimTree = true,
		},
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

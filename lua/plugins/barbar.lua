local config = function()
	local map = vim.api.nvim_set_keymap
	local opts = { noremap = true, silent = true }

	-- window bindings
	map('n', '<A-S-H>', '<Cmd>BufferNext<CR>', opts)
	map('n', '<A-S-L>', '<Cmd>BufferPrevious<CR>', opts)
	map('n', '<A-w>', '<Cmd>BufferClose!<CR>', opts)
	map('n', '<A-s>', '<Cmd>w<CR>', opts)
	map('n', '<A-q>', '<Cmd>qa!<CR>', opts)
	map('n', '<A-t>', '<Cmd>enew<CR>', opts)
	map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
	map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
	map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
	map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
	map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
	map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
	map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
	map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
	map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
	map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

	require('barbar').setup({
		animation = true,
		no_name_title = 'Untitled',
		icons = {
			filetype = {
				-- Sets the icon's highlight group.
				-- If false, will use nvim-web-devicons colors
				custom_colors = true,
				-- Requires `nvim-web-devicons` if `true`
				enabled = true,
			},
			separator = { right = '', left = '▎' },
			separator_at_end = '▎',
			-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
			-- buffer_index = 'superscript',
		},
		-- Sets the maximum padding width with which to surround each tab
		maximum_padding = 1,
		-- Set the filetypes which barbar will offset itself for
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

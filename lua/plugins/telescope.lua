local config = function()
	local actions = require('telescope.actions')

	require('telescope').setup({
		extensions = {
			['ui-select'] = { require('telescope.themes').get_dropdown() },
		},
		defaults = {
			mappings = {
				i = {
					['<esc>'] = actions.close,
				},
			},
		},
	})

	pcall(require('telescope').load_extension, 'ui-select')

	local builtin = require('telescope.builtin')
	vim.keymap.set(
		'n',
		'<leader>sw',
		builtin.live_grep,
		{ desc = '[S]earch [W]ords' }
	)
	vim.keymap.set(
		'n',
		'<leader>sf',
		builtin.find_files,
		{ desc = '[S]earch [F]iles' }
	)
	vim.keymap.set(
		'n',
		'<leader>tk',
		builtin.keymaps,
		{ desc = 'Telescope [K]eymaps' }
	)
end

return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = config,
}

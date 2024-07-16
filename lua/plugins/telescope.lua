local config = function()
	local actions = require('telescope.actions')

	require('telescope').setup({
		extensions = {
			['ui-select'] = { require('telescope.themes').get_dropdown() },
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
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
		'<leader>sk',
		builtin.keymaps,
		{ desc = 'Telescope [K]eymaps' }
	)
	local diagnostics = function() builtin.diagnostics({ bufnr = 0 }) end
	local references = function() builtin.lsp_references({ bufnr = 0 }) end
	vim.keymap.set(
		'n',
		'<leader>sd',
		diagnostics,
		{ desc = '[S]earch [D]iagnostics' }
	)
	vim.keymap.set(
		'n',
		'<leader>sr',
		references,
		{ desc = '[S]earch [R]eferences' }
	)
	vim.keymap.set(
		'n',
		'<leader>sb',
		builtin.buffers,
		{ desc = '[S]earch [B]uffers' }
	)
	vim.keymap.set(
		'n',
		'gd',
		vim.lsp.buf.definition,
		{ desc = 'Telescope [G]o [D]efinitions' }
	)
end

return {
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		config = config,
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
		config = function() require('telescope').load_extension('fzf') end,
	},
	{ 'nvim-telescope/telescope-ui-select.nvim' },
}

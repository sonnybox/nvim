local config = function()
	-- disable netrw
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	-- keybinds
	vim.keymap.set(
		'n',
		'<leader>e',
		':NvimTreeToggle<CR>',
		{ noremap = true, silent = true }
	)

	require('nvim-tree').setup({
		sort = {
			sorter = 'case_sensitive',
		},
		view = {
			width = 25,
		},
		renderer = {
			group_empty = true,
			icons = {
				glyphs = {
					git = {
						unstaged = '󰀨',
						staged = '󰗠',
						unmerged = '󰳡',
						renamed = '󰛿',
						untracked = '󰅙',
						deleted = '󰍶',
						ignored = '',
					},
				},
			},
		},
		filters = {
			dotfiles = false,
		},
	})
end

return {
	'nvim-tree/nvim-tree.lua',
	version = '*',
	lazy = false,
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = config,
}

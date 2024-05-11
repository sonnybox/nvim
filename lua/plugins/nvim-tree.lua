local config = function()
	-- disable netrw
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	vim.g.nvim_tree_visible = false

	function toggle_nvim_tree()
		if vim.g.nvim_tree_visible == false then
			vim.g.nvim_tree_visible = true
			vim.cmd(':NvimTreeFocus')
		else
			vim.cmd(':NvimTreeClose')
			vim.g.nvim_tree_visible = false
		end
	end

	-- keybinds
	vim.keymap.set(
		'n',
		'<leader>e',
		toggle_nvim_tree,
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

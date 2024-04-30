local config = function()
	require('nvim-treesitter.configs').setup({
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
			disable = { 'typescript', 'typescriptreact' },
		},
		autotag = {
			enable = true, -- requires ts autotag plugin
		},
		modules = {},
		ignore_install = {},
		ensure_installed = {},
		sync_install = false,
	})
end

return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = config,
}

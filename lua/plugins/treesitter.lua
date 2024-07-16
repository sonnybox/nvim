local config = function()
	local enabled = {
		'markdown',
		'hyprlang',
	}
	local indent = {
		'hyprlang',
	}
	require('nvim-treesitter.configs').setup({
		auto_install = false,
		sync_install = enabled,
		highlight = { enable = enabled },
		indent = { enable = indent },
		ignore_install = {},
		ensure_installed = {},
	})

	-- highlight copy (yank) section
	vim.api.nvim_create_autocmd('TextYankPost', {
		desc = 'Highlight when yanking (copying) text',
		group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
		callback = function() vim.highlight.on_yank() end,
	})
end

return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = config,
	event = { 'InsertEnter', 'LspAttach' },
}

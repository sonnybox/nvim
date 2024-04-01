local config = function()
	require('nvim-treesitter.configs').setup({
		autotag = {
			enable = true,
		},
		indent = {
			enable = true,
			-- disable = { 'python', 'c' }
		}
	})
end

return { 'windwp/nvim-ts-autotag', config = config }

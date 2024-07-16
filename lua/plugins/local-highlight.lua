return {
	'tzachar/local-highlight.nvim',
	config = function()
		vim.api.nvim_set_hl(0, 'CurrentWordHighlight', { bg = '#55555f' })
		vim.api.nvim_set_hl(0, 'GeneralWordHighlight', { bg = '#55555f' })
		require('local-highlight').setup({
			-- disable_file_types = {},
			hlgroup = 'GeneralWordHighlight',
			cw_hlgroup = 'CurrentWordHighlight',
			-- Whether to display highlights in INSERT mode or not
			insert_mode = true,
			min_match_len = 1,
			max_match_len = 128,
			highlight_single_match = true,
		})
	end,
}

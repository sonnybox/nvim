local config = function()
	require('which-key').register({
		['<leader>t'] = { name = '[T]elescope', _ = 'which_key_ignore' },
	})
end

return { 'folke/which-key.nvim', event = 'VimEnter', config = config }

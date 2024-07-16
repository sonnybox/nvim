-- Disable Alacritty padding when running Neovim
local alacritty = vim.api.nvim_create_augroup('alacritty', { clear = true })

vim.api.nvim_create_autocmd('VimEnter', {
	group = alacritty,
	callback = function()
		vim.fn.system(
			"alacritty msg --socket $ALACRITTY_SOCKET config -w $ALACRITTY_WINDOW_ID 'window.padding.x=0' 'window.padding.y=0'"
		)
	end,
})

vim.api.nvim_create_autocmd('VimLeavePre', {
	group = alacritty,
	callback = function()
		vim.fn.jobstart(
			'alacritty msg --socket $ALACRITTY_SOCKET config -w $ALACRITTY_WINDOW_ID -r',
			{ detach = true }
		)
	end,
})

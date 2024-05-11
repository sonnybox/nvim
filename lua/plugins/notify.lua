local config = function()
	---@diagnostic disable-next-line: undefined-field
	require('notify').setup({
		background_colour = '#000000',
	})
	vim.notify = require('notify')
end
return { 'rcarriga/nvim-notify', config = config }

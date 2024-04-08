local config = function()
	require('nvim-autopairs').setup({
		disable_filetype = { 'TelescopePrompt' },
		map_bs = false,
	})

	local cmp = require('cmp')
	local cmp_autopairs = require('nvim-autopairs.completion.cmp')

	cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

return { 'windwp/nvim-autopairs', event = 'InsertEnter', config = config }

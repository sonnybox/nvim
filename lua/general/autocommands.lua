-- highlight copy (yank) section
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function() vim.highlight.on_yank() end,
})

vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
	config = {
		-- Use a sharp border with `FloatBorder` highlights
		border = 'rounded',
		-- add the title in hover float window
		title = ' 󰛨 LSP Info ',

		-- adjust max width
		max_width = 60,
		max_height = 20,
		focus = false,
		close_events = { 'CursorMoved', 'CursorMovedI' },
	}
	config.focus_id = ctx.method
	if not (result and result.contents) then return end
	local markdown_lines =
		vim.lsp.util.convert_input_to_markdown_lines(result.contents)
	markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
	if vim.tbl_isempty(markdown_lines) then return end
	return vim.lsp.util.open_floating_preview(
		markdown_lines,
		'markdown',
		config
	)
end

-- local word highlighting and more lsp features
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				buffer = event.buf,
				callback = function()
					vim.lsp.buf.document_highlight()
					local cmp = require('cmp')
					if cmp.visible() == false or cmp.visible() == nil then
						vim.diagnostic.open_float()
					end
				end,
			})

			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				buffer = event.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end

		local map = function(keys, func, desc)
			vim.keymap.set(
				'n',
				keys,
				func,
				{ buffer = event.buf, desc = desc, remap = true }
			)
		end

		map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
		map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
		map('gd', vim.lsp.buf.definition, '[G]o to [d]efinition')
		map('K', vim.lsp.buf.hover, 'Hover')
	end,
})

-- Alacritty
local alacrittyAutoGroup =
	vim.api.nvim_create_augroup('alacritty', { clear = true })

vim.api.nvim_create_autocmd('VimEnter', {
	group = alacrittyAutoGroup,
	callback = function()
		vim.fn.system(
			"alacritty msg --socket $ALACRITTY_SOCKET config -w $ALACRITTY_WINDOW_ID options 'window.padding.x=0' 'window.padding.y=0'"
		)
	end,
})

vim.api.nvim_create_autocmd('VimLeavePre', {
	group = alacrittyAutoGroup,
	callback = function()
		vim.fn.jobstart(
			'alacritty msg --socket $ALACRITTY_SOCKET config -w $ALACRITTY_WINDOW_ID -r',
			{ detach = true }
		)
	end,
})

-- highlight copy (yank) section
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function() vim.highlight.on_yank() end,
})

-- fix hover style
local enable_hover = false
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
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ 'CursorHoldI' }, {
				buffer = event.buf,
				callback = function()
					local cmp = require('cmp')
					if
						vim.g.copilot_enabled == false
						or vim.g.copilot_enabled == nil
					then
						enable_hover = true
					end

					if cmp.visible() then enable_hover = false end

					if enable_hover then
						-- vim.defer_fn(vim.lsp.buf.hover, 333)
						vim.lsp.buf.hover()
					end
				end,
			})

			vim.api.nvim_create_autocmd({ 'CursorHold' }, {
				buffer = event.buf,
				callback = function() vim.diagnostic.open_float() end,
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
		map('K', vim.diagnostic.open_float, '[G]o to [D]eclaration')
	end,
})

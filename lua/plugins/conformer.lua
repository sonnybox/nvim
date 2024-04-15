local config = function()
	-- autoformat on save autocommand
	vim.api.nvim_create_autocmd('BufWritePre', {
		pattern = { '*.lua', '*.c', '*.cpp' },
		callback = function(args)
			require('conform').format({ bufnr = args.buf })
		end,
	})

	require('conform').setup({
		formatters_by_ft = {
			lua = { 'stylua' },
			c = { 'clang-format' },
			javascript = { 'prettierd' },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	})
end
return { 'stevearc/conform.nvim', config = config }

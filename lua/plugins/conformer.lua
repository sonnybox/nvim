local config = function()
	-- autoformat on save autocommand
	vim.api.nvim_create_autocmd('BufWritePre', {
		pattern = { '*.lua', '*.c', '*.cpp', '*.js*', '*.ts*' },
		callback = function(args)
			require('conform').format({ bufnr = args.buf })
		end,
	})

	require('conform').setup({
		log_level = vim.log.levels.DEBUG,
		formatters_by_ft = {
			lua = { 'stylua' },
			c = { 'clang-format' },
			javascript = { 'prettierd' },
			typescript = { 'prettier' },
			typescriptreact = { 'prettier' },
			javascriptreact = { 'prettier' },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = false,
		},
	})
end
return { 'stevearc/conform.nvim', config = config }

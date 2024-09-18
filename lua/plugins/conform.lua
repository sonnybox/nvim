-- Requires either the modules to be installed in the OS
-- OR through Mason!
local config = function()
	-- autoformat on save autocommand
	vim.api.nvim_create_autocmd('BufWritePre', {
		pattern = { '*' },
		callback = function(args)
			require('conform').format({
				bufnr = args.buf,
				lsp_fallback = true,
			})
		end,
	})

	require('conform').setup({
		log_level = vim.log.levels.DEBUG,
		formatters_by_ft = {
			lua = { 'stylua' },
			c = { 'clang-format' },
			javascript = { 'prettierd' },
			typescript = { 'prettierd' },
			typescriptreact = { 'prettierd' },
			javascriptreact = { 'prettierd' },
			json = { 'prettierd' },
			html = { 'prettierd' },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	})
end
return { 'stevearc/conform.nvim', config = config, event = 'InsertEnter' }

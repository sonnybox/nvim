local config = function()
	-- Diagnostic settings
	vim.diagnostic.config({
		signs = false,
		underline = true,
		update_in_insert = false,
		virtual_text = true,
		virtual_lines = false,
		float = {
			header = '  Diagnostics',
			border = 'rounded',
			focusable = false,
		},
	})

	local lsp = require('lspconfig')
	local defaults = require('cmp_nvim_lsp').default_capabilities()

	lsp.lua_ls.setup({
		settings = {
			Lua = {
				workspace = {
					checkThirdParty = false,
					library = vim.api.nvim_get_runtime_file('', true),
				},
				completion = {
					callSnippet = 'Replace',
				},
			},
		},
		capabilities = defaults,
	})

	lsp.pyright.setup({
		capabilities = defaults,
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					typeCheckingMode = 'off',
				},
			},
		},
	})

	lsp.clangd.setup({
		cmd = {
			'clangd',
			'--offset-encoding=utf-16',
		},
	})

	lsp.tsserver.setup({ capabilities = defaults })
	lsp.eslint.setup({})
	lsp.html.setup({ capabilities = defaults })
	lsp.tailwindcss.setup({})

	lsp.cssls.setup({ capabilities = defaults })
end

local mason = function()
	require('mason').setup({
		ui = {
			icons = {
				package_installed = '',
				package_pending = '',
				package_uninstalled = '',
			},
		},
	})
end

local masonlsp = function()
	require('mason-lspconfig').setup({
		automatic_installation = false,
		ensure_installed = {
			'lua_ls',
			'clangd',
			'tsserver',
			'tailwindcss',
			'cssls',
			'pyright',
			'eslint',
			'html',
		},
	})
end

local masontools = function()
	require('mason-tool-installer').setup({
		ensure_installed = {
			'prettier',
			'stylua',
			'clang-format',
		},
	})
end

return {
	{ 'williamboman/mason.nvim', config = mason },
	{ 'williamboman/mason-lspconfig.nvim', config = masonlsp },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'neovim/nvim-lspconfig', config = config },
	{ 'WhoIsSethDaniel/mason-tool-installer.nvim', config = masontools },
}

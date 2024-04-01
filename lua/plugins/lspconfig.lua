local config = function()
	local lsp = require('lspconfig')
	local defaults = require('cmp_nvim_lsp').default_capabilities()

	lsp.lua_ls.setup({
		settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim' }
				}
			}
		},
		capabilities = defaults
	})

	lsp.tsserver.setup{}

	lsp.tailwindcss.setup{}

	lsp.cssls.setup({
		capabilities = defaults
	})
end

local mason = function()
	require("mason").setup({
		ui = {
			icons = {
				package_installed = '',
				package_pending = '',
				package_uninstalled = ''
			}
		}
	})
end

local masonlsp = function()
	require('mason-lspconfig').setup({
		automatic_installation = false,
		ensure_installed = { 'lua_ls', 'clangd', 'tsserver', 'tailwindcss', 'cssls', 'eslint', }
	})
end

return {
	{ 'williamboman/mason.nvim', config = mason },
	{ 'williamboman/mason-lspconfig.nvim', config = masonlsp },
	{ 'hrsh7th/cmp-nvim-lsp', event = { 'InsertEnter', 'CmdlineEnter' }},
	{ 'neovim/nvim-lspconfig', config = config }
}
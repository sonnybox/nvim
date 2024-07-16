local lsp_opts = function()
	vim.g.virtual_text_opts = {
		source = false,
		spacing = 1,
		prefix = '',
		format = function(diagnostic)
			local source = diagnostic.message
			if diagnostic.severity == vim.diagnostic.severity.ERROR then
				return string.format('  You fucked up! %s', source)
			elseif diagnostic.severity == vim.diagnostic.severity.WARN then
				return string.format('  Careful lil bro, %s', source)
			elseif diagnostic.severity == vim.diagnostic.severity.INFO then
				return string.format('  FYI, %s', source)
			elseif diagnostic.severity == vim.diagnostic.severity.HINT then
				return string.format('  %s', source)
			end
		end,
	}
	vim.diagnostic.config({
		signs = false,
		underline = true,
		update_in_insert = false,
		virtual_text = vim.g.virtual_text_opts,
		virtual_lines = true,
		float = {
			-- header = '   Diagnostics',
			header = '',
			border = 'rounded',
			focusable = false,
			suffix = '',
			prefix = '',
			format = function(diagnostic)
				return string.format(
					' [%s] %s ',
					diagnostic.source,
					diagnostic.message
				)
			end,
		},
	})
	vim.lsp.handlers['textDocument/hover'] =
		vim.lsp.with(vim.lsp.handlers.hover, {
			border = 'rounded',
			-- title = '',
		})
	local hover = function()
		-- Check if there is a diagnostic at the current cursor position
		local line = vim.api.nvim_win_get_cursor(0)[1]
		local col = vim.api.nvim_win_get_cursor(0)[2]
		local diagnostics = vim.diagnostic.get(0, { lnum = line - 1 })
		if
			#diagnostics > 0
			and col >= diagnostics[1].col
			and col <= diagnostics[1].end_col
		then
			vim.diagnostic.open_float()
		else
			vim.lsp.buf.hover()
		end
	end
	vim.keymap.set('n', '<leader><leader>', hover, { desc = 'Hover LSP' })
	vim.keymap.set(
		'n',
		'<leader>ca',
		vim.lsp.buf.code_action,
		{ desc = '[C]ode [A]ctions' }
	)
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
	require('mason-lspconfig').setup({ automatic_installation = true })
	local lsp = require('lspconfig')
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	require('mason-lspconfig').setup_handlers({
		function(server_name)
			lsp[server_name].setup({
				capabilities = capabilities,
			})
		end,
		['lua_ls'] = function()
			lsp.lua_ls.setup({
				settings = {
					Lua = {
						-- workspace = {
						-- 	library = vim.api.nvim_get_runtime_file('', true),
						-- },
						diagnostics = {
							globals = { 'vim' },
						},
					},
				},
			})
		end,
		['pyright'] = function()
			lsp.pyright.setup({
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							typeCheckingMode = 'off',
						},
					},
				},
			})
		end,
		['clangd'] = function()
			lsp.clangd.setup({
				cmd = {
					'clangd',
					'--offset-encoding=utf-16', -- not needed if not using copilot.vim
				},
				capabilities = capabilities,
			})
		end,
	})
end

local masontools = function()
	require('mason-tool-installer').setup({
		ensure_installed = {
			'prettierd',
			'stylua',
			'clang-format',
		},
	})
end

local signature = function()
	require('lsp_signature').setup({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
		max_height = 12, -- max height of signature floating_window
		max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
		wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
		floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
		floating_window_above_cur_line = false, -- try to place the floating above the current line when possible Note:
		floating_window_off_x = 0, -- adjust float windows x position.
		floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
		hint_enable = true, -- virtual hint enable
		hint_prefix = '@param ', -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
		hint_scheme = 'variable',
		hi_parameter = 'LspSignatureActiveParameter', -- how your parameter will be highlight
		handler_opts = {
			border = 'rounded', -- double, rounded, single, shadow, none, or a table of borders
		},
		extra_trigger_chars = { '(', ',' }, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
		padding = ' ', -- character to pad on left and right of signature can be ' ', or '|'  etc
		timer_interval = 333, -- default timer check interval set to lower value if you want to reduce latency
		move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
	})
end

local cmp_opts = function()
	local cmp = require('cmp')
	local luasnip = require('luasnip')

	local select_down = function(fallback)
		if cmp.visible() then
			if cmp.get_selected_entry() == nil then
				cmp.close()
				fallback()
			else
				cmp.select_next_item({ behavior = cmp.SelectBehavior })
			end
		else
			fallback()
		end
	end

	local select_up = function(fallback)
		if cmp.visible() then
			if cmp.get_selected_entry() == nil then
				cmp.close()
				fallback()
			else
				cmp.select_prev_item({ behavior = cmp.SelectBehavior })
			end
		else
			fallback()
		end
	end

	local select_abort = function(fallback)
		if cmp.visible() then cmp.close() end
		fallback()
	end

	local select_tab = function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif luasnip.expand_or_locally_jumpable() then
			luasnip.expand_or_jump()
		else
			fallback()
		end
	end

	local select_stab = function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif luasnip.expand_or_locally_jumpable(-1) then
			luasnip.expand_or_jump(-1)
		else
			fallback()
		end
	end

	cmp.setup({
		snippet = {
			expand = function(args) require('luasnip').lsp_expand(args.body) end,
		},
		mapping = {
			['<down>'] = cmp.mapping({
				i = select_down,
			}),
			['<up>'] = cmp.mapping({
				i = select_up,
			}),
			['<left>'] = cmp.mapping({
				i = select_abort,
			}),
			['<right>'] = cmp.mapping({
				i = select_abort,
			}),
			['<s-tab>'] = cmp.mapping({
				i = select_stab,
			}),
			['<tab>'] = cmp.mapping({
				i = select_tab,
			}),
			['<cr>'] = cmp.mapping.confirm({ select = false }),
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},

		sources = cmp.config.sources({
			{ name = 'luasnip', option = { use_show_condition = false } },
			{ name = 'path', max_item_count = 5 },
			{ name = 'nvim_lsp', max_item_count = 10 },
			{ name = 'buffer', max_item_count = 3 },
		}),
		view = { docs = { auto_open = true } },
		formatting = {
			fields = { 'kind', 'abbr', 'menu' },
			expandable_indicator = true,
			format = function(entry, vim_item)
				local kind = require('lspkind').cmp_format({
					mode = 'symbol_text',
					maxwidth = 50,
				})(entry, vim_item)
				local strings = vim.split(kind.kind, '%s', { trimempty = true })
				kind.kind = '' .. (strings[1] or '') .. ''
				kind.menu = ' ' .. (strings[2] or '')
				return kind
			end,
		},
	})

	cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline({
			['<down>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end, { 'c' }),
			['<up>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { 'c' }),
		}),
		sources = {
			{ name = 'buffer' },
		},
	})

	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline({
			['<down>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end, { 'c' }),
			['<up>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { 'c' }),
		}),
		sources = cmp.config.sources({
			{ name = 'path' },
			{ name = 'cmdline' },
		}),
	})
end

return {
	{ 'williamboman/mason.nvim', config = mason },
	{ 'williamboman/mason-lspconfig.nvim', config = masonlsp },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{
		'hrsh7th/nvim-cmp',
		event = { 'InsertEnter', 'CmdlineEnter' },
		config = cmp_opts,
		dependencies = {
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-buffer',
			'onsails/lspkind.nvim',
			'L3MON4D3/LuaSnip',
		},
	},
	{ 'neovim/nvim-lspconfig', config = lsp_opts },
	{ 'WhoIsSethDaniel/mason-tool-installer.nvim', config = masontools },
	{ 'ray-x/lsp_signature.nvim', config = signature },
}

local config = function()
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
		matching = { disallow_symbol_nonprefix_matching = false },
	})
end

local snippets = function() require('luasnip.loaders.from_vscode').lazy_load() end

return {
	{
		'L3MON4D3/LuaSnip',
		version = 'v2.*',
		build = 'make install_jsregexp',
		config = snippets,
		dependencies = {
			'rafamadriz/friendly-snippets',
			'saadparwaiz1/cmp_luasnip',
		},
	},
	{
		'hrsh7th/nvim-cmp',
		event = { 'InsertEnter', 'CmdlineEnter' },
		config = config,
	},
	{ 'hrsh7th/cmp-cmdline', event = { 'InsertEnter', 'CmdlineEnter' } },
	{ 'hrsh7th/cmp-buffer', event = { 'InsertEnter', 'CmdlineEnter' } },
	{ 'hrsh7th/cmp-path', event = { 'InsertEnter', 'CmdlineEnter' } },
}

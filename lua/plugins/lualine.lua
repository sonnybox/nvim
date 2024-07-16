local config = function()
	local clients_lsp = function()
		local clients = vim.lsp.get_clients()
		if next(clients) == nil then return '' end
		local c = {}
		for _, client in pairs(clients) do
			table.insert(c, client.name)
		end

		-- custom client names
		local replacements = {
			['lua_ls'] = '󰢱 ',
			['GitHub Copilot'] = vim.g.copilot_enabled and ' ' or ' ',
			['tailwindcss'] = '󱏿 ',
			['clangd'] = ' ',
			['tsserver'] = ' ',
			['pyright'] = ' ',
			['bashls'] = ' ',
			['eslint'] = '󰱺 ',
		}
		for i, v in ipairs(c) do
			c[i] = replacements[v] or v
		end
		return 'LSP ' .. table.concat(c, '')
	end

	local lsp = {
		clients_lsp,
		color = { fg = '#aaacee' },
		component_separators = { left = '', right = '' },
		padding = { right = 0, left = 0 },
	}

	local mode = {
		'mode',
		color = { fg = '#99cc66' },
		icons_enabled = true,
		icon = '',
		component_separators = { left = '', right = '' },
	}

	local location = {
		'location',
		padding = { right = 1 },
	}

	local progress = {
		'progress',
		component_separators = { left = '', right = '' },
		padding = { right = 1, left = 1 },
	}

	local filename = {
		'filename',
		color = { fg = '#ee9966' },
		icons_enabled = true,
		icon = '󱝁',
	}

	local date = {
		'os.date("%a, %b %d  %l:%M %p ")',
		color = { fg = '#accccb' },
		component_separators = { right = '', left = '' },
	}

	local search = {
		'searchcount',
		color = { fg = '#6969ce' },
		icons_enabled = true,
		icon = '',
	}

	local custom_theme = require('lualine.themes.kanagawa')
	local clear = 'none'
	custom_theme.normal.c.bg = clear
	require('lualine').setup({
		options = {
			icons_enabled = true,
			theme = custom_theme,
			component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
			globalstatus = true,
			refresh = { statusline = 1000 },
		},
		sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				mode,--[[  filename, ]]
				'diagnostics',
			},
			lualine_x = { search, lsp, date, progress, location },
			lualine_y = {},
			lualine_z = {},
		},
	})
end

return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = config,
}

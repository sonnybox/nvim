local config = function()
	-- LSP clients attached to buffer
	-- local clients_lsp = function ()
	-- 	local bufnr = vim.api.nvim_get_current_buf()
	--
	-- 	local clients = vim.lsp.buf_get_clients(bufnr)
	-- 	if next(clients) == nil then
	-- 		return ''
	-- 	end
	--
	-- 	local c = {}
	-- 	for _, client in pairs(clients) do
	-- 		table.insert(c, client.name)
	-- 	end
	-- 	return '' .. table.concat(c, '')
	-- end

	-- local fileformat = {
	-- 	'fileformat',
	-- 	icons_enabled = false,
	-- }

	local branch = {
		'branch',
		icon = ''
	}

	local mode = {
		'mode',
		separator = { left = '' },
	}

	local location = {
		'location',
		separator = { right = '' }
	}

	require('lualine').setup {
		options = {
			icons_enabled = true,
			theme = 'auto',
			component_separators = { left = '', right = ''},
			section_separators = { left = '', right = ''},
			disabled_filetypes = {
				statusline = {
					'toggleterm',
					'trouble',
					'NvimTree'
				},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			}
		},
		sections = {
			lualine_a = { mode, },
			lualine_b = { 'filename', 'diagnostics' },
			lualine_c = { branch, 'diff' },
			lualine_x = { 'filetype' },
			-- lualine_x = {'encoding', fileformat, 'filetype', clients_lsp },
			lualine_y = {'progress'},
			lualine_z = { location }
		},
		-- inactive_sections = {
			--   lualine_a = {},
			--   lualine_b = {},
			--   lualine_c = {'filename'},
			--   lualine_x = {'location'},
			--   lualine_y = {},
			--   lualine_z = {}
			-- },
			-- tabline = {},
			-- winbar = { lualine_a = { 'filename' }},
			inactive_winbar = {},
			extensions = {}
		}
end
return { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }, config = config }

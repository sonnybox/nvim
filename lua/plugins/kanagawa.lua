local config = function()
	require('kanagawa').setup({
		compile = false, -- if true run :KanagawaCompile after updates to configuration
		undercurl = true, -- enable undercurls
		commentStyle = { italic = true, bold = true },
		functionStyle = { bold = true, italic = true },
		keywordStyle = { bold = true, italic = true },
		statementStyle = { bold = true, italic = true },
		typeStyle = { bold = true, italic = true },
		terminalColors = false, -- switch terminal colors to colorscheme
		transparent = true,
		colors = {
			palette = {
				sumiInk0 = 'none',
				sumiInk1 = 'none',
				sumiInk2 = 'none',
				sumiInk3 = 'none',
				sumiInk4 = 'none',
				sumiInk5 = '#33333f', -- highlight color
				sumiInk6 = '#666666', -- indent line color
				waveBlue1 = '#2f2f50', -- selection color
				waveBlue2 = '#11111f', -- text update color
			},
		},
		theme = 'wave',
	})
	vim.cmd.colorscheme('kanagawa')
end
return { 'rebelot/kanagawa.nvim', config = config, lazy = false }

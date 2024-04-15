local config = function()
	require('kanagawa').setup({
		compile = false, -- enable compiling the colorscheme
		undercurl = true, -- enable undercurls
		commentStyle = { italic = false },
		keywordStyle = { bold = true },
		statementStyle = { bold = true },
		transparent = true, -- do not set background color
		dimInactive = false, -- dim inactive window `:h hl-NormalNC`
		terminalColors = true, -- define vim.g.terminal_color_{0,17}
		colors = { -- add/modify theme and palette colors
			palette = {
				sumiInk4 = 'none',
			},
		},

		overrides = function()
			return {
				Pmenu = { blend = vim.o.pumblend }, -- add `blend = vim.o.pumblend` to enable transparency
				PmenuSbar = { blend = vim.o.pumblend },
				PmenuThumb = { blend = vim.o.pumblend },
			}
		end,
		theme = 'wave', -- Load "wave" theme when 'background' option is not set
	})

	vim.cmd('colorscheme kanagawa')
end

return { 'rebelot/kanagawa.nvim', config = config }

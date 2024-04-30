local config = function()
	-- set keymaps
	vim.keymap.set(
		't',
		'<esc>',
		'<c-\\><c-n>:ToggleTerm<CR>',
		{ noremap = true }
	)
	vim.keymap.set('n', '<leader>j', ':ToggleTerm<CR>i', { noremap = true })

	require('toggleterm').setup({
		-- size can be a number or function which is passed the current terminal
		size = 5,
		open_mapping = nil,
		hide_numbers = true, -- hide the number column in toggleterm buffers
		shade_filetypes = {},
		autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
		highlights = {
			-- highlights which map to a highlight group name and a table of it's values
			-- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
		},
		shade_terminals = false, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
		start_in_insert = false,
		insert_mappings = true, -- whether or not the open mapping applies in insert mode
		terminal_mappings = false, -- whether or not the open mapping applies in the opened terminals
		persist_size = true,
		persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
		direction = 'float',
		close_on_exit = true, -- close the terminal window when the process exits
		-- Change the default shell. Can be a string or a function returning a string
		shell = vim.o.shell,
		auto_scroll = true, -- automatically scroll to the bottom on terminal output
		-- This field is only relevant if direction is set to 'float'
		float_opts = {
			-- The border key is *almost* the same as 'nvim_open_win'
			-- see :h nvim_open_win for details on borders however
			-- the 'curved' border is a custom border type
			-- not natively supported but implemented in this plugin.
			border = 'curved',
			-- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
			-- width = <value>,
			-- height = <value>,
			-- row = <value>,
			-- col = <value>,
			-- winblend = 3,
			-- zindex = <value>,
			title_pos = 'center',
		},
		winbar = {
			enabled = false,
			name_formatter = function(term) --  term: Terminal
				return term.name
			end,
		},
	})
end

return { 'akinsho/toggleterm.nvim', version = '*', config = config }

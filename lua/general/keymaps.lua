-- make changing windows easier
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move focus to the upper window' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>sd', vim.diagnostic.open_float, { desc = '[S]how [d]iagnostic' })
vim.keymap.set('n', '<leader>qf', vim.diagnostic.setloclist, { desc = '[Q]uick[f]ix' })

-- toggle wrap (line)
local toggle_wrap = function()
	if vim.o.wrap then
		vim.o.wrap = false
	else
		vim.o.wrap = true
	end
end

vim.keymap.set('n', '<leader>tw', toggle_wrap, { desc = '[T]oggle [W]rap' })

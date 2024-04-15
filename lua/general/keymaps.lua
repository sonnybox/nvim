-- make changing windows easier
vim.keymap.set(
	'n',
	'<C-h>',
	'<C-w>h',
	{ desc = 'Move focus to the left window' }
)
vim.keymap.set(
	'n',
	'<C-l>',
	'<C-w>l',
	{ desc = 'Move focus to the right window' }
)
vim.keymap.set(
	'n',
	'<C-j>',
	'<C-w>j',
	{ desc = 'Move focus to the lower window' }
)
vim.keymap.set(
	'n',
	'<C-k>',
	'<C-w>k',
	{ desc = 'Move focus to the upper window' }
)

vim.keymap.set(
	'n',
	'<leader>qf',
	vim.diagnostic.setloclist,
	{ desc = '[Q]uick[f]ix' }
)

-- toggle wrap (line)
local toggle_wrap = function()
	if vim.o.wrap then
		vim.o.wrap = false
	else
		vim.o.wrap = true
	end
end

vim.keymap.set('n', '<leader>w', toggle_wrap, { desc = '[w]rap' })

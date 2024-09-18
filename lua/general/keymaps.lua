-- make changing windows easier
vim.keymap.set(
	'n',
	'<A-h>',
	'<C-w>h',
	{ desc = 'Move focus to the left window' }
)
vim.keymap.set(
	'n',
	'<A-l>',
	'<C-w>l',
	{ desc = 'Move focus to the right window' }
)
vim.keymap.set(
	'n',
	'<A-j>',
	'<C-w>j',
	{ desc = 'Move focus to the lower window' }
)
vim.keymap.set(
	'n',
	'<A-k>',
	'<C-w>k',
	{ desc = 'Move focus to the upper window' }
)

-- with arrow keys
vim.keymap.set(
	'n',
	'<C-left>',
	'<C-w>h',
	{ desc = 'Move focus to the left window' }
)
vim.keymap.set(
	'n',
	'<C-right>',
	'<C-w>l',
	{ desc = 'Move focus to the right window' }
)
vim.keymap.set(
	'n',
	'<C-down>',
	'<C-w>j',
	{ desc = 'Move focus to the lower window' }
)
vim.keymap.set(
	'n',
	'<C-up>',
	'<C-w>k',
	{ desc = 'Move focus to the upper window' }
)
-- toggle wrap (line)
local toggle_wrap = function() vim.o.wrap = not vim.o.wrap end
vim.keymap.set('n', '<leader>w', toggle_wrap, { desc = '[w]rap' })

-- undo in insert mode
vim.keymap.set('i', '<C-u>', '<C-g>u<C-u>', { desc = 'Undo in insert mode' })

-- redo in insert mode
vim.keymap.set(
	'i',
	'<C-r>',
	'<esc><C-r>a',
	{ desc = 'Redo in insert mode', noremap = true }
)

-- better new lines (below and above)
vim.keymap.set('n', '<CR>', 'm`o<Esc>``')
vim.keymap.set('n', '<S-CR>', 'm`O<Esc>``')

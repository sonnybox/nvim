-- move cursor inside insert mode with alt
vim.api.nvim_set_keymap('i', '<M-h>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '<M-j>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('i', '<M-k>', '<Up>', { noremap = true })
vim.api.nvim_set_keymap('i', '<M-l>', '<Right>', { noremap = true })

-- move windows with ctrl + arrow keys
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

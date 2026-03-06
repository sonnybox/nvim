-- copy
vim.keymap.set(
    { 'v', 'n', 'x' },
    '<leader>y',
    '"+y<CR>',
    { desc = 'Copy to system clipboard.' }
)

-- paste
vim.keymap.set(
    { 'v', 'n', 'x' },
    '<leader>p',
    '"+p<CR>',
    { desc = 'Paste from system clipboard.' }
)

-- cut
vim.keymap.set(
    { 'v', 'n', 'x' },
    '<leader>c',
    '"+d<CR>',
    { desc = 'Paste from system clipboard.' }
)

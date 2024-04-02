-- terminal stuff
vim.keymap.set('t', '<esc>', '<c-\\><c-n>',  { noremap = true })
vim.keymap.set('n', '<leader>j', ':ToggleTerm<CR>', { noremap = true })

-- file explorer
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })

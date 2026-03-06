vim.o.number = true

local toggle_numbers = function() vim.o.number = not vim.o.number end
vim.keymap.set('n', '<leader>n', toggle_numbers, { desc = 'Toggle [N]umbers' })

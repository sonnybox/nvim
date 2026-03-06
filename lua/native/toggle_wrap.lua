vim.opt.linebreak = true
vim.o.wrap = false

local toggle_wrap = function() vim.o.wrap = not vim.o.wrap end
vim.keymap.set('n', '<leader>w', toggle_wrap, { desc = 'Toggle [W]rap' })

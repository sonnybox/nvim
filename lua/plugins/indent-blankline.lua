local opts = {
    whitespace = { remove_blankline_trail = true },
    scope = { enabled = false },
    indent = { char = '│' }
}

return { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = opts }

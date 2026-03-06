local hover = function()
    -- Check if there is a diagnostic at the current cursor position
    local line = vim.api.nvim_win_get_cursor(0)[1]
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local diagnostics = vim.diagnostic.get(0, { lnum = line - 1 })
    if
        #diagnostics > 0
        and col >= diagnostics[1].col
        and col <= diagnostics[1].end_col
    then
        vim.diagnostic.open_float()
    else
        vim.lsp.buf.hover()
    end
end

vim.keymap.set('n', '<leader><leader>', hover, { desc = 'Hover' })

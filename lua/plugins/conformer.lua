local config = function()

    -- autoformat on save autocommand
    vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.lua',
        callback = function(args) require('conform').format({ bufnr = args.buf }) end,
    })

    require('conform').setup({
        formatters_by_ft = {
            lua = { 'stylua' },
            javascript = { 'prettierd' },
        },
    })
end
return { 'stevearc/conform.nvim', config = config }

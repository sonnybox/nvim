local config = function()
    require('conform').setup({
        log_level = vim.log.levels.DEBUG,
        formatters_by_ft = {
            lua = { 'stylua' },
            python = { 'ruff_organize_imports', 'ruff_format' },
        },

        format_on_save = {
            timeout_ms = 500,
            lsp_format = 'fallback',
        },
    })

    vim.api.nvim_create_user_command('Format', function(args)
        local range = nil
        if args.count ~= -1 then
            local end_line = vim.api.nvim_buf_get_lines(
                0,
                args.line2 - 1,
                args.line2,
                true
            )[1]
            range = {
                start = { args.line1, 0 },
                ['end'] = { args.line2, end_line:len() },
            }
        end

        require('conform').format({
            async = true,
            lsp_format = 'fallback',
            range = range,
        })
    end, { range = true })

    vim.keymap.set(
        '',
        '<leader>f',
        function()
            require('conform').format({ async = true, lsp_format = 'fallback' })
        end,
        { desc = '[F]ormat buffer' }
    )
end
return { 'stevearc/conform.nvim', config = config, event = 'BufReadPost' }

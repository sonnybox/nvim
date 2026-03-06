local config = function()
    local centered = function()
        local height = math.floor(0.618 * vim.o.lines)
        local width = math.floor(0.618 * vim.o.columns)
        return {
            anchor = 'NW',
            height = height,
            width = width,
            row = math.floor(0.5 * (vim.o.lines - height)),
            col = math.floor(0.5 * (vim.o.columns - width)),
        }
    end

    require('mini.icons').setup()
    require('mini.files').setup()
    -- require('mini.surround').setup()
    require('mini.jump').setup()
    require('mini.pick').setup({
        window = { config = centered },
    })
    require('mini.extra').setup()
    -- require('mini.cursorword').setup()
    require('mini.git').setup()
    require('mini.diff').setup()
    -- require('mini.statusline').setup()
    require('mini.tabline').setup()
    require('mini.clue').setup({
        triggers = {
            { mode = 'n', keys = '<leader>' },
        },
    })

    local hipatterns = require('mini.hipatterns')
    hipatterns.setup({
        highlighters = {
            hex_color = hipatterns.gen_highlighter.hex_color(),
        },
    })

    local indentscope = require('mini.indentscope')
    indentscope.setup({
        symbol = '│',
        draw = { animation = indentscope.gen_animation.none() },
    })

    local noti = require('mini.notify')
    noti.setup()
    vim.notify = noti.make_notify({
        ERROR = { duration = 5000 },
        WARN = { duration = 4000 },
        INFO = { duration = 3000 },
    })

    require('mini.ai').setup({ silent = true })

    vim.keymap.set(
        'n',
        '<leader>e',
        require('mini.files').open,
        { noremap = true, silent = true, desc = 'Open file explorer' }
    )

    vim.keymap.set(
        'n',
        '<leader>sf',
        function() MiniPick.builtin.files() end,
        { noremap = true, silent = true, desc = 'Search files' }
    )

    vim.keymap.set(
        'n',
        '<leader>st',
        function() MiniPick.builtin.grep_live() end,
        { noremap = true, silent = true, desc = 'Search text' }
    )

    vim.keymap.set(
        'n',
        '<leader>d',
        function() MiniExtra.pickers.diagnostic() end,
        { noremap = true, silent = true, desc = 'Search diagnostics' }
    )
end

return {
    'echasnovski/mini.nvim',
    config = config,
    version = false,
}

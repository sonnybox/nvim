local config = function()
    vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        once = true,
        callback = function(ev) vim.treesitter.start(ev.buf) end,
    })

    require('render-markdown').setup({
        completions = { coq = { enabled = true } },
        sign = { enabled = false },
        heading = { position = 'inline', icons = { ' ' }, border = true },
        checkbox = {
            checked = { scope_highlight = '@markup.strikethrough' },
            custom = {
                todo = {
                    raw = '[-]',
                    rendered = '󰄗 ',
                    highlight = 'RenderMarkdownTodo',
                    scope_highlight = nil,
                },
            },
        },
        pipe_table = {
            alignment_indicator = '',
            head = 'Normal',
            row = 'Normal',
        },
        bullet = { icons = { '', '', '◆', '◇' } },
    })
end

return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    config = config,
}

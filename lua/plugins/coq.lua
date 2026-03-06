local config = function()
    require('coq_3p')({
        { src = 'nvimlua', short_name = 'nLUA' },
        { src = 'bc', short_name = 'MATH', precision = 6 },
    })
end
return {
    'neovim/nvim-lspconfig', -- REQUIRED: for native Neovim LSP integration
    lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
    dependencies = {
        { 'ms-jpq/coq_nvim', branch = 'coq' },
        { 'ms-jpq/coq.artifacts', branch = 'artifacts' },

        -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
        { 'ms-jpq/coq.thirdparty', branch = '3p' },
    },
    init = function()
        vim.g.coq_settings = {
            auto_start = 'shut-up',
            display = {
                icons = { mode = 'short' },
                ghost_text = { enabled = false },
                pum = {
                    source_context = { '', '' },
                    kind_context = { ' |', '' },
                },
                preview = {
                    border = 'rounded',
                },
            },
        }
    end,
    config = config,
}

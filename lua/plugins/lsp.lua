local masontools = function()
    require('mason-tool-installer').setup({
        ensure_installed = {
            'stylua',
            'lua_ls',
            'basedpyright',
            'ruff',
        },
    })
end

local masonlsp = function()
    vim.lsp.inlay_hint.enable(true)

    local servers = {
        basedpyright = {
            settings = {
                basedpyright = {
                    analysis = {
                        typeCheckingMode = 'basic',
                        inlayHints = {
                            variableTypes = true,
                            callArgumentNames = true,
                            functionReturnTypes = true,
                        },
                    },
                },
            },
        },
        ruff = {},

        lua_ls = {
            settings = {
                Lua = {
                    diagnostics = {
                        disable = { 'missing-fields' },
                    },
                },
            },
        },
    }

    for name, config in pairs(servers) do
        config.capabilities =
            require('coq').lsp_ensure_capabilities(config.capabilities or {})
        vim.lsp.config[name] = config
        vim.lsp.enable(name)
    end
end

local mason = function()
    require('mason').setup({
        ui = {
            icons = {
                package_installed = '',
                package_pending = '',
                package_uninstalled = '',
            },
        },
    })
end

return {
    { 'williamboman/mason.nvim', config = mason },
    { 'WhoIsSethDaniel/mason-tool-installer.nvim', config = masontools },
    {
        'williamboman/mason-lspconfig.nvim',
        config = masonlsp,
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            {
                'folke/lazydev.nvim',
                ft = 'lua',
                opts = {
                    library = {
                        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                    },
                },
            },
        },
    },
}

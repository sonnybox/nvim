local config = function()
    require('tokyonight').setup({
        transparent = true,
    })

    vim.cmd('colorscheme tokyonight-night')
end
return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = config,
}

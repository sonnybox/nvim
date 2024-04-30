-- :TSInstall hyprlang
vim.filetype.add({
	pattern = { ['.*/hyprland%.conf'] = 'hyprlang' },
})

return {
	'luckasRanarison/tree-sitter-hyprlang',
	dependencies = { 'nvim-treesitter/nvim-treesitter' },
}

local config = function()
	vim.keymap.set('i', '<C-Tab>', 'copilot#Accept("\\<CR>")', {
		expr = true,
		replace_keycodes = false,
		silent = true,
	})

	vim.g.copilot_enabled = false

	local function toggleCopilot()
		if vim.g.copilot_enabled == false then
			-- print('󰊤 Copilot enabled')
			vim.g.copilot_enabled = true
		else
			vim.g.copilot_enabled = false
			-- print('󰊤 Copilot disabled')
		end
	end

	vim.keymap.set('n', '<leader>cp', toggleCopilot, { desc = '[C]o[p]ilot' })
end

return { 'github/copilot.vim', config = config }

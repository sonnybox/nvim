vim.keymap.set('n', '<leader>cc', function()
	local line = vim.api.nvim_get_current_line()

	local rules = {
		{ '[ ]', '[x]' },
		{ '[-]', '[x]' },
		{ '[x]', '[ ]' },
	}

	for _, r in ipairs(rules) do
		local from, to = r[1], r[2]
		local pat = vim.pesc(from)
		if line:find(pat) then
			local new_line = line:gsub(pat, to, 1)
			vim.api.nvim_set_current_line(new_line)
			return
		end
	end
end, { desc = 'toggle checkbox', silent = true })

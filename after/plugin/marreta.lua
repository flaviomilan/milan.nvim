local wk = require("which-key")
wk.register({
	["<leader>m"] = {
		m = { '<cmd>%s/\\v(.+)/"\\1",/<CR>', '"word", each line' },
		n = { '<cmd>%s/\\n\\|\\s\\+/", "/g | %s/\\v^(.*[^ ]) *$/\\"\\1\\"/g<CR>', '"word", same line' },
		d = {
			function()
				RemoveDuplicates()
			end,
			"remove duplicated items",
		},
	},
})

function RemoveDuplicates()
	local bufnr = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	local seen = {}
	local unique_lines = {}

	for _, line in ipairs(lines) do
		if not seen[line] then
			table.insert(unique_lines, line)
			seen[line] = true
		end
	end

	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, unique_lines)
end

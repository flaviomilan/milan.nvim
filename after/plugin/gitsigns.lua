require("gitsigns").setup({
	signs = {
		add = { text = "│" },
		change = { text = "│" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		follow_files = true,
	},
	auto_attach = true,
	attach_to_untracked = false,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
		virt_text_priority = 100,
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
})

local wk = require("which-key")
wk.register({
	g = {
		s = { "<cmd>lua require'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
		r = { "<cmd>lua require'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
		S = { "<cmd>lua require'gitsigns'.stage_buffer()<CR>", "Stage Buffer" },
		u = { "<cmd>lua require'gitsigns'.undo_stage_hunk()<CR>", "Undo Stage Hunk" },
		R = { "<cmd>lua require'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
		p = { "<cmd>lua require'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
		b = { "<cmd>lua require'gitsigns'.blame_line{full=true}<CR>", "Blame Line" },
		d = { "<cmd>lua require'gitsigns'.diffthis()<CR>", "Diff This" },
		D = { "<cmd>lua require'gitsigns'.diffthis('~')<CR>", "Diff This ~" },
		tb = { "<cmd>lua require'gitsigns'.toggle_current_line_blame()<CR>", "Toggle Line Blame" },
		td = { "<cmd>lua require'gitsigns'.toggle_deleted()<CR>", "Toggle Deleted" },
	},
}, { prefix = "<leader>" })

-- Para mapeamentos visuais, você precisa registrar separadamente
wk.register({
	g = {
		name = "[G]it",
		s = { ":lua require'gitsigns'.stage_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>", "Stage Hunk" },
		r = { ":lua require'gitsigns'.reset_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>", "Reset Hunk" },
	},
}, { prefix = "<leader>", mode = "v" }) -- modo visual

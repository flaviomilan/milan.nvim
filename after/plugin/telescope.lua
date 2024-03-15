require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

local builtin = require("telescope.builtin")

-- configure which-key
local wk = require("which-key")
wk.register({
	["<leader>"] = {
		["<leader>"] = { builtin.buffers, "[ ] Find existing buffers" },
		["/"] = {
			function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end,
			"[/] Fizzily search in current buffer",
		},
	},
	["<leader>s"] = {
		h = { builtin.help_tags, "[S]earch [H]elp" },
		k = { builtin.keymaps, "[S]earch [K]eymaps" },
		f = { builtin.find_files, "[S]earch [F]iles" },
		s = { builtin.builtin, "[S]earch [S]elect Telescope" },
		w = { builtin.grep_string, "[S]earch current [W]ord" },
		g = { builtin.live_grep, "[S]earch by [G]rep" },
		d = { builtin.diagnostics, "[S]earch [D]iagnostics" },
		r = { builtin.resume, "[S]earch [R]esume" },
		n = {
			function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end,
			"[S]earch [N]eovim files",
		},
		["."] = { builtin.oldfiles, '[S]earch Recent Files ("." for repeat)' },
		["/"] = {
			function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end,
			"[S]earch [/] in Open Files",
		},
	},
})

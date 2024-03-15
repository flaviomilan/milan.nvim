local wk = require("which-key")
wk.register({
	["<leader>p"] = {
		d = { "<cmd>Telescope neovim-project discover<cr>", "Find projects" },
		h = { "<cmd>Telescope neovim-project history<cr>", "History" },
		l = { "<cmd>NeovimProjectLoadRecent<cr>", "Load recent" },
	},
})

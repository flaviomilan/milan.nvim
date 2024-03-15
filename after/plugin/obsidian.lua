local wk = require("which-key")
wk.register({
	["<leader>Z"] = {
		-- notes
		n = {
			name = "[N]otes",
			q = { "<cmd>ObsidianQuickSwitch<cr>", "Quick Switch" },
			c = { "<cmd>ObsidianNew<cr>", "Create new" },
			s = { "<cmd>ObsidianSearch<cr>", "Search all" },
		},

		-- journal
		j = {
			name = "[J]ournal",
			y = { "<cmd>ObsidianYesterday<cr>", "Yesterday" },
			t = { "<cmd>ObsidianToday<cr>", "Today" },
			o = { "<cmd>ObsidianTomorrow<cr>", "Tomorrow" },
		},

		-- links
		l = {
			name = "[L]inks",
			m = { "<cmd>ObsidianBacklinks<cr>", "Show location list of backlinks" },
			n = { "<cmd>ObsidianFollowLink<cr>", "Follow under cursor" },
			o = { "<cmd>ObsidianLinks<cr>", "Show all links" },
		},

		-- templates, tags and workspaces
		t = { "<cmd>ObsidianTemplate<cr>", "Templates" },
		p = { "<cmd>ObsidianTags<cr>", "Tags" },
		w = { "<cmd>ObsidianWorkspace<cr>", "Workspaces" },
	},
})

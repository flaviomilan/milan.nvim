require("obsidian").setup({
	workspaces = {
		{
			name = "zettelkasten",
			path = "~/zettelkasten",
		},
	},

	notes_subdir = "notes",

	log_level = vim.log.levels.INFO,

	daily_notes = {
		folder = "journal",
		date_format = "%Y-%m-%d",
		alias_format = "%B %-d, %Y",
		template = "journal-template.md",
	},

	completion = {
		nvim_cmp = true,
		min_chars = 2,
	},

	mappings = {
		["gf"] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
		["<leader>ch"] = {
			action = function()
				return require("obsidian").util.toggle_checkbox()
			end,
			opts = { buffer = true },
		},
	},

	new_notes_location = "notes_subdir",

	note_id_func = function(title)
		local suffix = ""
		if title ~= nil then
			suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
		else
			for _ = 1, 4 do
				suffix = suffix .. string.char(math.random(65, 90))
			end
		end
		return tostring(os.time()) .. "-" .. suffix
	end,

	note_path_func = function(spec)
		local path = spec.dir / tostring(spec.id)
		return path:with_suffix(".md")
	end,

	wiki_link_func = function(opts)
		return require("obsidian.util").wiki_link_id_prefix(opts)
	end,

	markdown_link_func = function(opts)
		return require("obsidian.util").markdown_link(opts)
	end,

	preferred_link_style = "wiki",

	image_name_func = function()
		return string.format("%s-", os.time())
	end,

	disable_frontmatter = false,

	note_frontmatter_func = function(note)
		if note.title then
			note:add_alias(note.title)
		end

		local out = { id = note.id, aliases = note.aliases, tags = note.tags }

		if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
			for k, v in pairs(note.metadata) do
				out[k] = v
			end
		end

		return out
	end,

	templates = {
		subdir = "templates",
		date_format = "%Y-%m-%d",
		time_format = "%H:%M",
		substitutions = {},
	},

	follow_url_func = function(url)
		vim.fn.jobstart({ "open", url }) -- Mac OS
	end,

	use_advanced_uri = false,

	open_app_foreground = false,

	picker = {
		name = "telescope.nvim",
		mappings = {
			new = "<C-x>",
			insert_link = "<C-l>",
		},
	},

	sort_by = "modified",
	sort_reversed = true,

	open_notes_in = "current",

	callbacks = {
		post_setup = function(client) end,
		enter_note = function(client, note) end,
		leave_note = function(client, note) end,
		pre_write_note = function(client, note) end,
		post_set_workspace = function(client, workspace) end,
	},

	ui = {
		enable = true, -- set to false to disable all additional syntax features
		update_debounce = 200, -- update delay after a text change (in milliseconds)
		checkboxes = {
			[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
			["x"] = { char = "", hl_group = "ObsidianDone" },
			[">"] = { char = "", hl_group = "ObsidianRightArrow" },
			["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },

			-- software development
			["P"] = { char = "▣", hl_group = "ObsidianTodo" }, -- in progress
			["R"] = { char = "◩", hl_group = "ObsidianTodo" }, -- code review
			["D"] = { char = "■", hl_group = "ObsidianTodo" }, -- deployment
		},
		bullets = { char = "•", hl_group = "ObsidianBullet" },
		external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
		reference_text = { hl_group = "ObsidianRefText" },
		highlight_text = { hl_group = "ObsidianHighlightText" },
		tags = { hl_group = "ObsidianTag" },
		block_ids = { hl_group = "ObsidianBlockID" },
		hl_groups = {
			ObsidianTodo = { bold = true, fg = "#f78c6c" },
			ObsidianDone = { bold = true, fg = "#89ffbc" },
			ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
			ObsidianTilde = { bold = true, fg = "#ff5370" },
			ObsidianBullet = { bold = true, fg = "#89ddff" },
			ObsidianRefText = { underline = true, fg = "#c792ea" },
			ObsidianExtLinkIcon = { fg = "#c792ea" },
			ObsidianTag = { italic = true, fg = "#89ddff" },
			ObsidianBlockID = { italic = true, fg = "#89ddff" },
			ObsidianHighlightText = { bg = "#75662e" },
		},
	},

	attachments = {
		img_folder = "assets/imgs", -- This is the default
		img_text_func = function(client, path)
			path = client:vault_relative_path(path) or path
			return string.format("![%s](%s)", path.name, path)
		end,
	},
})

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

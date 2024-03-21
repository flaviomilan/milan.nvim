local black0 = "#191D24"
local black1 = "#1E222A"
local black2 = "#222630"
local gray0 = "#242933"
local gray1 = "#2E3440"
local gray2 = "#3B4252"
local gray3 = "#434C5E"
local gray4 = "#4C566A"
local gray5 = "#60728A"
local white_alt = "#C0C8D8"
local white0 = "#BBC3D4"
local white1 = "#D8DEE9"
local white2 = "#E5E9F0"
local white3 = "#ECEFF4"
local magenta = "#B48EAD"
local magenta_b = "#BE9DB8"
local magenta_d = "#A07EA1"
local green = "#A3BE8C"
local green_b = "#B1C89D"
local green_d = "#97B67C"
local yellow = "#EBCB8B"
local yellow_b = "#EFD49F"
local yellow_d = "#E7C173"
local orange = "#D08770"
local orange_b = "#D79784"
local orange_d = "#CB775D"
local red = "#BF616A"
local red_b = "#C5727A"
local red_d = "#B74E58"
local cyan = "#8FBCBB"
local cyan_b = "#9FC6C5"
local cyan_d = "#80B3B2"
local blue0 = "#5E81AC"
local blue1 = "#81A1C1"
local blue2 = "#88C0D0"

require("obsidian").setup({
	workspaces = {
		{
			name = "zettelkasten",
			path = "~/zettelkasten",
		},
	},

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

	notes_subdir = "zettel",
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
		-- post_setup = function(client) end,
		-- enter_note = function(client, note) end,
		-- leave_note = function(client, note) end,
		-- pre_write_note = function(client, note) end,
		-- post_set_workspace = function(client, workspace) end,
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

		-- nordic theme
		hl_groups = {
			ObsidianTodo = { bold = true, fg = orange_b },
			ObsidianDone = { bold = true, fg = green_b },
			ObsidianRightArrow = { bold = true, fg = yellow_b },
			ObsidianTilde = { bold = true, fg = red_b },
			ObsidianBullet = { bold = true, fg = blue1 },
			ObsidianRefText = { underline = true, fg = yellow_b },
			ObsidianExtLinkIcon = { fg = magenta_b },
			ObsidianTag = { italic = true, fg = orange_b },
			ObsidianBlockID = { italic = true, fg = orange_d },
			ObsidianHighlightText = { bg = cyan_b },
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

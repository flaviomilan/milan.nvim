require("which-key").setup()

vim.o.timeout = true
vim.o.timeoutlen = 500

require("which-key").register({
	-- INFO: Code binds
	["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },

	-- INFO: Document binds
	["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },

	-- INFO: Git binds
	["<leader>g"] = { name = "[G]it" },

	-- INFO: LSP binds
	["<leader>l"] = { name = "[L]sp" },

	-- INFO: Marreta binds
	["<leader>m"] = { name = "[M]arreta" },

	-- INFO: Navigation binds
	["<leader>n"] = { name = "[N]avigate", e = { vim.cmd.Ex, "Explorer" } },

	-- INFO: Projects binds
	["<leader>p"] = { name = "[P]rojects" },

	-- INFO: Rename binds
	["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },

	-- INFO: Search binds
	["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },

	-- INFO: Workspace binds
	["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },

	-- INFO: Zettelkasten binds
	["<leader>Z"] = { name = "[Z]ettelkasten" },
})

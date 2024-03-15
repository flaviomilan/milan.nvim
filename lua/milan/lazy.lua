local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			routes = {
				{
					filter = { event = "notify", find = "No information available" },
					opts = { skip = true },
				},
			},
			presets = {
				lsp_doc_border = true,
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").load()
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
	},

	-- INFO: Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"joshmedeski/telescope-smart-goto.nvim",
			'nvim-telescope/telescope-ui-select.nvim'
		},
	},

	-- INFO: LSP
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
}

require("lazy").setup(plugins, {
	change_detection = {
		notify = false,
	},
})

require("lualine").setup({
	options = {
		theme = "nordic",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	extensions = { "fugitive", "quickfix", "fzf", "lazy", "mason", "nvim-dap-ui", "oil", "trouble" },
})

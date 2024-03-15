local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		javascriptreact = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
		json = { { "prettierd", "prettier" } },
		graphql = { { "prettierd", "prettier" } },
		css = { { "prettierd", "prettier" } },
		scss = { { "prettierd", "prettier" } },
		java = { "google-java-format" },
		kotlin = { "ktlint" },
		markdown = { { "prettierd", "prettier" } },
		html = {},
		bash = { "beautysh" },
		proto = { "buf" },
		rust = { "rustfmt" },
		yaml = { "yamlfix" },
		toml = { "taplo" },
		python = { "isort", "black" },
	},
})

-- configure wich-key
local wk = require("which-key")
wk.register({
	["<leader>l"] = {
		l = {
			function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end,
			"Lint",
		},
	},
})

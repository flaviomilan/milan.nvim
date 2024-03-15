local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		-- c/cpp
		c = { "clang_format" },
		cpp = { "clang_format" },

		-- rust
		rust = { "rustfmt" },

		-- python
		python = { "isort", "black" },

		-- golang
		go = { "gofmt", "goimports" },

		-- lua
		lua = { "stylua" },

		-- javascript/typescript
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },

		-- jvm
		java = {},
		-- groovy = {},
		-- kotlin = { "ktlint" },

		-- file type
		json = { "prettier" },
		yaml = { "yamlfix", "yamlfmt" },
		toml = { "taplo" },
		graphql = { "prettier" },
		hcl = { "packer_fmt" },
		css = { "prettier" },
		scss = { "prettier" },
		markdown = { "markdownlint" },
		bash = { "shfmt" },
		sh = { "shfmt" },
		zsh = { "shfmt" },
		proto = { "buf" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 1000,
		lsp_fallback = true,
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

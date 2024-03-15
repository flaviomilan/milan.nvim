local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		-- languages
		-- c/cpp
		"clangd",

		-- rust
		"rust_analyzer",

		-- python
		"ruff_lsp",

		-- golang
		"gopls",

		-- lua
		"lua_ls",

		-- javascript/typescript
		"eslint",
		"tsserver",

		-- jvm
		"jdtls",
		-- "groovyls",
		-- "kotlin_language_server",

		-- bash
		"bashls",

		-- web
		"html",

		-- file type
		-- json
		"jsonls",
		-- yaml
		"yamlls",
		-- toml
		"taplo",
		-- graphql
		"graphql",
		-- css/scss
		"cssls",
		-- html
		"html",
		-- protobuf
		"bufls",
		-- dockerfile
		"dockerls",
	},

	handlers = {
		lsp_zero.default_setup,
	},
})

require("java").setup()
require("lspconfig").jdtls.setup({
	settings = {
		java = {
			-- home = "/usr/lib/jvm/java-17-openjdk-amd64",
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
				runtimes = {
					{
						name = "Oracle-17",
						path = "~/.sdkman/candidates/java/17.0.10-oracle",
						default = true,
					},
					{
						name = "Oracle-21",
						path = "~/.sdkman/candidates/java/21.0.2-oracle",
					},
					{
						name = "Amazon-17",
						path = "~/.sdkman/candidates/java/17.0.10-amzn",
					},
					{
						name = "Amazon-21",
						path = "~/.sdkman/candidates/java/21.0.2-amzn",
					},
				},
			},
		},
	},
})

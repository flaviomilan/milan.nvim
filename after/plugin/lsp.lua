local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bfnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd",
		"lua_ls",
		"vimls",
		"elixirls",
		"erlangls",
		"groovyls",
		"jdtls",
		"kotlin_language_server",
		"docker_compose_language_service",
		"dockerls",
		"jsonls",
		"html",
		"terraformls",
		"gopls",
		"bashls",
		"ruby_ls",
		"remark_ls",
		"pyright",
		"tsserver",
		"rust_analyzer",
		"eslint",
	},
	handlers = {
		lsp_zero.default_setup,
	},
})

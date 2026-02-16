return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				markdown = { "prettier", lsp_format = "fallback" },
				css = { "prettier", lsp_format = "fallback" },
				php = { "pint", "php-cs-fixer", lsp_format = "fallback" },
				go = { "gofmt", lsp_format = "fallback" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			-- format_on_save = {
			--     lsp_fallback = true,
			--     async = false,
			-- },
		})
	end,
}

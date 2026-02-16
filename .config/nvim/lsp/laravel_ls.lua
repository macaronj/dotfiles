local blink = require("blink.cmp")

return {
	cmd = { "laravel-ls" },
	filetypes = { "php", "blade" },
	root_markers = { "artisan" },
	-- root_dir = vim.fn.getcwd(),
	capabilities = vim.tbl_deep_extend(
		"force",
		{},
		vim.lsp.protocol.make_client_capabilities(),
		blink.get_lsp_capabilities()
	),
}

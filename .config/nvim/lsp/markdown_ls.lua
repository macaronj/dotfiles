return {
	cmd = {
		"marksman",
		"server",
	},
	filetypes = {
		"markdown",
		"markdown.mdx",
	},
	rootmarkers = { ".marksman.toml", ".git" },
	-- settings = {
	--     Lua = {
	--         diagnostics = {
	--             --     disable = { "missing-parameters", "missing-fields" },
	--         },
	--     },
	-- },

	single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Warning,
}

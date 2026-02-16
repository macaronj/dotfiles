return {
	"catgoose/nvim-colorizer.lua",
	event = "VeryLazy",
	opts = {
		lazy_load = true,
		-- other setup options
		user_default_options = {
			-- Tailwind colors.  boolean|'normal'|'lsp'|'both'.  True sets to 'normal'
			tailwind = "both", -- enable tailwind colors
			tailwind_opts = { -- Options for highlighting tailwind names
				update_names = true, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
			},
		},
	},
}

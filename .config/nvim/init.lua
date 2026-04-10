vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes:1"
vim.o.confirm = true
vim.o.termguicolors = true
vim.g.mapleader = " "
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.winborder = "rounded"
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.cmd("syntax off")
vim.opt.clipboard = "unnamedplus"

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Installed Plug ins
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/brenoprata10/nvim-highlight-colors" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", make = "build" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/vague-theme/vague.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("*") },
})

vim.cmd.packadd("cfilter")
vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")

-- Plug in configuration
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

require("blink.cmp").setup({
	completion = { documentation = { auto_show = true } },
	-- fuzzy = { implementation = "lua" },
})
require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "gofmt" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettier", stop_after_first = true },
	},
})
require("nvim-treesitter").setup({
	highlight = { enable = true },
	indent = { enable = true },
	folds = { enable = true },
	ensure_installed = { "lua", "rust", "javascript", "typescript", "markdown", "go", "gomod", "gosum" },
})

-- Auto-attach parser on file type change
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
require("oil").setup({
	lsp_file_methods = {
		enabled = true,
		timeout_ms = 1000,
		autosave_changes = true,
	},
	columns = {
		"icon",
		-- "permissions",
		"size",
		-- "mtime",
	},
	float = {
		max_width = 0.3,
		max_height = 0.6,
		border = "rounded",
	},
})

require("nvim-highlight-colors").setup({
	render = "virtual",
	---Set virtual symbol (requires render to be set to 'virtual')
	virtual_symbol = "■",
})

---@type vim.lsp.Config
local config = {
	---@type lspconfig.settings.lua_ls
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				preloadFileSize = 10000,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		},
	},
}

vim.lsp.config("lua_ls", config)
vim.lsp.enable({ "lua_ls", "gopls" })

vim.cmd.colorscheme("vague")

-- Keymaps
vim.keymap.set("n", "<leader>e", ":Oil<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

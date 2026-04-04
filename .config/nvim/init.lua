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

-- Installed Plug ins
vim.pack.add{
	{src = "https://github.com/nvim-treesitter/nvim-treesitter"},
	{src = "https://github.com/neovim/nvim-lspconfig"},
	{src = "https://github.com/brenoprata10/nvim-highlight-colors"},
	{src = "https://github.com/neovim/nvim-lspconfig"},
	{src = "https://github.com/nvim-treesitter/nvim-treesitter"},
	{src = "https://github.com/stevearc/oil.nvim"},
	{src = "https://github.com/vague-theme/vague.nvim"},
}

vim.cmd.packadd("cfilter")
vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")

-- Plug in configuration
require("nvim-treesitter").setup({
  highlight = { enable = true },
  indent = { enable = true },
  folds = { enable = true },
  ensure_installed = { "lua", "rust", "javascript", "typescript", "markdown" , "go",  "gomod",
    "gosum"},
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
	},
	float = {
		max_width = 0.3,
		max_height = 0.6,
		border = "rounded",
	},
})


require('nvim-highlight-colors').setup({
	render = 'virtual',
---Set virtual symbol (requires render to be set to 'virtual')
	virtual_symbol = '■',
})

---@type vim.lsp.Config
local config = {
  ---@type lspconfig.settings.lua_ls
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        preloadFileSize = 10000,
        library = {
          vim.env.VIMRUNTIME,
        }
      },
    },
  },
}

vim.lsp.config('lua_ls', config)
vim.lsp.enable({"lua_ls", "gopls"})

vim.cmd.colorscheme("vague")

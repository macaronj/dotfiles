if vim.g.vscode then
	-- VSCode extension
else
	-- ordinary Neovim
  require("config.options")
  require("core.lazy")
  require("core.lsp")
	require("config.keymaps")
	require("config.autocmds")

	vim.cmd.colorscheme("vague")
end

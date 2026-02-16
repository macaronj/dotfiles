vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-s>", "<CMD>update<CR>", { desc = "Save" })
vim.keymap.set("n", "<C-q>", "<CMD>q<CR>", { desc = "Quit" })
vim.keymap.set({ "n", "v" }, "<C-f>", "<CMD>Format<CR>", { desc = "Format" })
vim.keymap.set({ "v", "i" }, "jk", "<Esc>", { noremap = true })
-- vim.keymap.set("n", "<leader>e", ":Ex<cr>", { desc = "Open [E]xplorer" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- FzfLua
vim.keymap.set({ "n", "v" }, "<leader><leader>", "<CMD>FzfLua oldfiles<cr>", { desc = "Picker resume" })
vim.keymap.set({ "n", "v" }, "<leader>f", "<CMD>FzfLua files<CR>", { desc = "Picker files" })
vim.keymap.set({ "n", "v" }, "<leader>h", "<CMD>FzfLua helptags<CR>", { desc = "Picker help" })
vim.keymap.set({ "n", "v" }, "<leader>b", "<CMD>FzfLua buffers<CR>", { desc = "Picker buffers" })
vim.keymap.set({ "n", "v" }, "<leader>g", "<CMD>FzfLua git_files<CR>", { desc = "Picker grep" })
vim.keymap.set({ "n", "v" }, "<leader>fg", "<CMD>FzfLua grep<CR>", { desc = "Picker grep" })
vim.keymap.set({ "n", "v" }, "<leader>fl", "<CMD>FzfLua live_grep<CR>", { desc = "Picker grep_live" })
vim.keymap.set(
	{ "n", "v" },
	"<leader>fc",
	"<CMD>FzfLua files cwd=~/.config/nvim<CR>",
	{ desc = "Picker neovim config" }
)
vim.keymap.set(
	{ "n", "v" },
	"<leader>fo",
	"<CMD>FzfLua files cwd=~/Documents/Nextcloud/Orgfiles/<CR>",
	{ desc = "Picker Notes" }
)

-- Move Lines
vim.keymap.set("n", "<A-j>", "<CMD>m .+1<CR>==") -- move line up(n)
vim.keymap.set("n", "<A-k>", "<CMD>m .-2<CR>==") -- move line down(n)
vim.keymap.set("v", "<A-j>", "<CMD>m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<A-k>", "<CMD>m '<-2<CR>gv=gv") -- move line down(v)

-- Disable arrow keys in Normal mode
-- vim.keymap.set("n", "<left>", "")
-- vim.keymap.set("n", "<down>", "")
-- vim.keymap.set("n", "<up>", "")
-- vim.keymap.set("n", "<right>", "")
--
-- -- Disable arrow keys in Insert mode
-- vim.keymap.set("i", "<left>", "")
-- vim.keymap.set("i", "<down>", "")
-- vim.keymap.set("i", "<up>", "")
-- vim.keymap.set("i", "<right>", "")
--
-- -- Disable arrow keys in Visual mode
-- vim.keymap.set("v", "<left>", "")
-- vim.keymap.set("v", "<down>", "")
-- vim.keymap.set("v", "<up>", "")
-- vim.keymap.set("v", "<right>", "")

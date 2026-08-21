-- ==================================================================
-- KEYMAPS
-- ==================================================================

vim.g.mapleader = " " -- space for leader
vim.g.maplocalleader = " " -- space for localleader

-- better movement in wrapped text
vim.keymap.set("n", "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
vim.keymap.set("n", "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

local function keymap_set(mode, combination, action, description)
	vim.keymap.set(mode, combination, action, { desc = description })
end

keymap_set("n", "<leader>c", ":nohlsearch<CR>", "Clear search highlights")

keymap_set("n", "n", "nzzzv", "Next search result (centered)")
keymap_set("n", "N", "Nzzzv", "Previous search result (centered)")
keymap_set("n", "<C-d>", "<C-d>zz", "Half page down (centered)")
keymap_set("n", "<C-u>", "<C-u>zz", "Half page up (centered)")

keymap_set("x", "<leader>p", '"_dP', "Paste without yanking")
keymap_set({ "n", "v" }, "<leader>x", '"_d', "Delete without yanking")

keymap_set("n", "<leader>bn", ":bnext<CR>", "Next buffer")
keymap_set("n", "<leader>bp", ":bprevious<CR>", "Previous buffer")

keymap_set("n", "<C-h>", "<C-w>h", "Move to left window")
keymap_set("n", "<C-j>", "<C-w>j", "Move to bottom window")
keymap_set("n", "<C-k>", "<C-w>k", "Move to top window")
keymap_set("n", "<C-l>", "<C-w>l", "Move to right window")

keymap_set("n", "<leader>sv", ":vsplit<CR>", "Split window vertically")
keymap_set("n", "<leader>sh", ":split<CR>", "Split window horizontally")

keymap_set("n", "<C-Up>", ":resize +2<CR>", "Increase window height")
keymap_set("n", "<C-Down>", ":resize -2<CR>", "Decrease window height")
keymap_set("n", "<C-Left>", ":vertical resize -2<CR>", "Decrease window width")
keymap_set("n", "<C-Right>", ":vertical resize +2<CR>", "Increase window width")

keymap_set("n", "<A-j>", ":m .+1<CR>==", "Move line down")
keymap_set("n", "<A-k>", ":m .-2<CR>==", "Move line up")
keymap_set("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move selection down")
keymap_set("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move selection up")

keymap_set("v", "<", "<gv", "Indent left and reselect")
keymap_set("v", ">", ">gv", "Indent right and reselect")

keymap_set("n", "J", "mzJ`z", "Join lines and keep cursor position")

vim.keymap.set("n", "<leader>pa", function() -- show file path
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })

vim.keymap.set("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })

vim.g.startify_change_to_dir = 0
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_lists = {
	{ type = "dir", header = { "   MRU" .. vim.fn.getcwd() } },
	{ type = "files", header = { "   MRU" } },
}

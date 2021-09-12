local u = require("utils")

local chadtree_settings = {
	options = { polling_rate = 60 },
	view = { width = 32 },
	theme = { text_colour_set = "nord" },
}
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

-- Start CHADTree when Vim starts with a directory argument.
u.exec([[
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'CHADopen' | wincmd p | enew | execute 'cd '.argv()[0] | endif
]])

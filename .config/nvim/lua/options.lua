-- Enable mouse
vim.opt.mouse = "a"
-- Completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- Cursorhold
vim.g.cursorhold_updatetime = 500
-- System clipboard
vim.opt.clipboard:append("unnamedplus")
-- Ignore case
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Encoding
vim.opt.encoding = "utf-8"
-- Line numbers and signcolumn
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
-- TODO: This doesn't work with telescope
-- vim.opt.signcolumn = "auto:2-4"
-- Hide mode messages
vim.opt.showmode = false
vim.opt.shortmess:append("c")
-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = -1
vim.opt.expandtab = false
vim.opt.smarttab = true
-- Wrapping
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
-- Scrolling
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 12
-- Split direction
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Folds
vim.opt.foldmethod = "syntax"
vim.opt.foldlevelstart = 9999
-- Layout remaps (doesn't work with keybindings)
-- vim.opt.langremap = true
-- vim.opt.langmap =
-- 	"ЙЦУКЕНГШЩЗХЪЇҐФЫІВАПРОЛДЖЭЄЯЧСМИТЬБЮ\\,;QWERTYUIOP{}}\\\\ASSDFGHJKL:\"\"ZXCVBNM<>?,йцукенгшщзхъїґфыівапролджэєячсмитьбю.;qwertyuiop[]]\\\\assdfghjkl\\;''zxcvbnm\\,./"
-- Firenvim font
vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h14"
-- Enable rgb colors
if vim.fn.has("termguicolors") == 1 then
	vim.opt.termguicolors = true
end
-- Neovide
vim.g.neovide_transparency = 0.8

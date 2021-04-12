-- Utils
system_name = ""
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
end
map = vim.api.nvim_set_keymap
exec = function(text) vim.api.nvim_exec(text, false) end
t =
				function(str)
					return vim.api.nvim_replace_termcodes(str, true, true, true)
				end

-- TODO: Remove when https://github.com/neovim/neovim/pull/13479 lands
local opts_info = vim.api.nvim_get_all_options_info()
local opt = setmetatable({}, {
	__index = vim.o,
	__newindex = function(_, key, value)
		vim.o[key] = value
		local scope = opts_info[key].scope
		if scope == "win" then
			vim.wo[key] = value
		elseif scope == "buf" then
			vim.bo[key] = value
		end
	end
})

-- Options
opt.mouse = "a"
opt.completeopt = "menu,menuone,noselect"
opt.clipboard = "unnamedplus"
opt.ignorecase = true
opt.smartcase = true
opt.encoding = "utf-8"
opt.number = true
opt.relativenumber = true
opt.showmode = false
opt.shortmess = vim.o.shortmess .. "c"
opt.signcolumn = "yes"
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 0
opt.wrap = true
opt.linebreak = true
opt.expandtab = false
opt.splitbelow = true
opt.splitright = true
opt.foldlevelstart = 9999
opt.langremap = true
opt.langmap = "ЙЦУКЕНГШЩЗХЪЇҐФЫІВАПРОЛДЖЭЄЯЧСМИТЬБЮ\\,;QWERTYUIOP{}}\\\\ASSDFGHJKL:\"\"ZXCVBNM<>?,йцукенгшщзхъїґфыівапролджэєячсмитьбю.;qwertyuiop[]]\\\\assdfghjkl\\;''zxcvbnm\\,./"

if vim.fn.has("termguicolors") == 1 then opt.termguicolors = true end

vim.g.neovide_transparency = 0.8

vim.g.mapleader = ";"

-- Split navigation
map('', '<A-h>', '<cmd>wincmd h<CR>', {noremap = true, silent = true})
map('', '<A-Left>', '<cmd>wincmd h<CR>', {noremap = true, silent = true})
map('', '<A-k>', '<cmd>wincmd k<CR>', {noremap = true, silent = true})
map('', '<A-Up>', '<cmd>wincmd k<CR>', {noremap = true, silent = true})
map('', '<A-j>', '<cmd>wincmd j<CR>', {noremap = true, silent = true})
map('', '<A-Down>', '<cmd>wincmd j<CR>', {noremap = true, silent = true})
map('', '<A-l>', '<cmd>wincmd l<CR>', {noremap = true, silent = true})
map('', '<A-Right>', '<cmd>wincmd l<CR>', {noremap = true, silent = true})
map('', '<leader><A-h>', '<cmd>wincmd H<CR>', {noremap = true, silent = true})
map('', '<leader><A-Left>', '<cmd>wincmd H<CR>', {noremap = true, silent = true})
map('', '<leader><A-k>', '<cmd>wincmd K<CR>', {noremap = true, silent = true})
map('', '<leader><A-Up>', '<cmd>wincmd K<CR>', {noremap = true, silent = true})
map('', '<leader><A-j>', '<cmd>wincmd J<CR>', {noremap = true, silent = true})
map('', '<leader><A-Down>', '<cmd>wincmd J<CR>', {noremap = true, silent = true})
map('', '<leader><A-l>', '<cmd>wincmd L<CR>', {noremap = true, silent = true})
map('', '<leader><A-Right>', '<cmd>wincmd L<CR>', {noremap = true, silent = true})

-- Splits
map('', '<leader>h', ':split<Space>', {noremap = true, silent = true})
map('', '<leader>v', ':vsplit<Space>', {noremap = true, silent = true})
map('', '<leader>th', '<cmd>split term://$SHELL<CR>',
    {noremap = true, silent = true})
map('', '<leader>tv', '<cmd>vsplit term://$SHELL<CR>',
    {noremap = true, silent = true})

-- Tabs
map('', '<A-Tab>', '<cmd>tabnext<CR>', {noremap = true, silent = true})
map('', '<A-w>', '<cmd>tabclose<CR>', {noremap = true, silent = true})
map('', '<A-t>', '<cmd>tabnew<CR>', {noremap = true, silent = true})

-- Replace alias
map('', 'S', ':%s//gI<Left><Left><Left>', {})

-- Quit
map('', '<C-q>', '<cmd>q<CR>', {})
map('', '<C-Q>', '<cmd>q!<CR>', {})
map('', '<leader>x', '<cmd>q<CR>', {})
map('', '<leader>wq', '<cmd>wq<CR>', {})
map('', '<leader>w', '<cmd>w<CR>', {})

-- Move lines up and down
map('n', '<C-A-j>', ':m .+1<CR>==', {noremap = true, silent = true})
map('n', '<C-A-Down>', ':m .+1<CR>==', {noremap = true, silent = true})
map('n', '<C-A-k>', ':m .-2<CR>==', {noremap = true, silent = true})
map('n', '<C-A-Up>', ':m .-2<CR>==', {noremap = true, silent = true})
map('i', '<C-A-j>', '<Esc>:m .+1<CR>==gi', {noremap = true, silent = true})
map('i', '<C-A-Down>', '<Esc>:m .+1<CR>==gi', {noremap = true, silent = true})
map('i', '<C-A-k>', '<Esc>:m .-2<CR>==gi', {noremap = true, silent = true})
map('i', '<C-A-Up>', '<Esc>:m .-2<CR>==gi', {noremap = true, silent = true})
map('v', '<C-A-j>', ':m \'>+1<CR>gv=gv', {noremap = true, silent = true})
map('v', '<C-A-Down>', ':m \'>+1<CR>gv=gv', {noremap = true, silent = true})
map('v', '<C-A-k>', ':m \'<-2<CR>gv=gv', {noremap = true, silent = true})
map('v', '<C-A-Up>', ':m \'<-2<CR>gv=gv', {noremap = true, silent = true})


-- Don't yank deleted text
map('n', '<leader>d', '"_d', {noremap = true, silent = true})
map('v', '<leader>d', '"_d', {noremap = true, silent = true})
map('v', 'p', '"_dp', {noremap = true, silent = true})

require("plugins")


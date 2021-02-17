local map = vim.api.nvim_set_keymap

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
  end,
})

opt.mouse = "a"
opt.completeopt = "menu,menuone,noselect"
opt.clipboard = "unnamedplus"
opt.ignorecase = true
opt.smartcase = true
opt.encoding = "utf-8"
-- opt.number = true
opt.relativenumber = true
opt.showmode = false
opt.shortmess = vim.o.shortmess .. "c"
opt.signcolumn = "yes"
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 0
opt.expandtab = false
opt.splitbelow = true
opt.splitright = true

if vim.fn.has("termguicolors") == 1 then
	opt.termguicolors  = true
end
vim.api.nvim_exec("colorscheme nvcode", false)

vim.g.mapleader = ";"

map('i', '<C-Space>', 'compe#complete()', {noremap = true, silent = true, expr = true})
map('i', '<CR>', 'compe#confirm(\'<CR>\')', {noremap = true, silent = true, expr = true})
map('i', '<C-e>', 'compe#close(\'<C-e>\')', {noremap = true, silent = true, expr = true})
map('i', '<C-f>', 'compe#scroll({ \'delta\': +4 })', {noremap = true, silent = true, expr = true})
map('i', '<C-d>', 'compe#scroll({ \'delta\': -4 })', {noremap = true, silent = true, expr = true})

map('', '<A-h>', '<cmd>wincmd h<CR>', {noremap = true, silent = true})
map('', '<A-Left>', '<cmd>wincmd h<CR>', {noremap = true, silent = true})
map('', '<A-k>', '<cmd>wincmd k<CR>', {noremap = true, silent = true})
map('', '<A-Up>', '<cmd>wincmd k<CR>', {noremap = true, silent = true})
map('', '<A-j>', '<cmd>wincmd j<CR>', {noremap = true, silent = true})
map('', '<A-Down>', '<cmd>wincmd j<CR>', {noremap = true, silent = true})
map('', '<A-l>', '<cmd>wincmd l<CR>', {noremap = true, silent = true})
map('', '<A-Right>', '<cmd>wincmd l<CR>', {noremap = true, silent = true})

map('', '<A-Tab>', '<cmd>tabnext<CR>', {noremap = true, silent = true})
map('', '<A-w>', '<cmd>tabclose<CR>', {noremap = true, silent = true})
map('', '<A-t>', '<cmd>tabnew<CR>', {noremap = true, silent = true})

map('', '<leader>h', ':split<Space>', {noremap = true, silent = true})
map('', '<leader>v', ':vsplit<Space>', {noremap = true, silent = true})

map('', '<leader>th', '<cmd>split term://$SHELL<CR>', {noremap = true, silent = true})
map('', '<leader>tv', '<cmd>vsplit term://$SHELL<CR>', {noremap = true, silent = true})

require("plugins")

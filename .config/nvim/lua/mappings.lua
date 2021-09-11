local u = require("utils")

vim.g.mapleader = ";"

-- Split navigation
u.map("", "<A-h>", "<cmd>wincmd h<CR>")
u.map("", "<A-Left>", "<cmd>wincmd h<CR>")
u.map("", "<A-k>", "<cmd>wincmd k<CR>")
u.map("", "<A-Up>", "<cmd>wincmd k<CR>")
u.map("", "<A-j>", "<cmd>winmd j<CR>")
u.map("", "<A-Down>", "<cmd>wincmd j<CR>")
u.map("", "<A-l>", "<cmd>wincmd l<CR>")
u.map("", "<A-Right>", "<cmd>wincmd l<CR>")
u.map("", "<leader><A-h>", "<cmd>wincmd H<CR>")
u.map("", "<leader><A-Left>", "<cmd>wincmd H<CR>")
u.map("", "<leader><A-k>", "<cmd>wincmd K<CR>")
u.map("", "<leader><A-Up>", "<cmd>wincmd K<CR>")
u.map("", "<leader><A-j>", "<cmd>wincmd J<CR>")
u.map("", "<leader><A-Down>", "<cmd>wincmd J<CR>")
u.map("", "<leader><A-l>", "<cmd>wincmd L<CR>")
u.map("", "<leader><A-Right>", "<cmd>wincmd L<CR>")

-- Splits
u.map("", "<leader>h", ":split<Space>")
u.map("", "<leader>v", ":vsplit<Space>")
u.map("", "<leader>th", "<cmd>split term://$SHELL<CR>")
u.map("", "<leader>tv", "<cmd>vsplit term://$SHELL<CR>")

-- Tabs
u.map("", "<A-Tab>", "<cmd>tabnext<CR>")
u.map("", "<A-q>", "<cmd>tabclose<CR>")
u.map("", "<A-t>", "<cmd>tabnew<CR>")

-- Replace alias
u.map("", "S", ":%s//gI<Left><Left><Left>", {})

-- Quit
u.map("", "<C-q>", "<cmd>q<CR>")
u.map("", "<C-Q>", "<cmd>q!<CR>")
u.map("", "<leader>x", "<cmd>q<CR>")
u.map("", "<leader>wq", "<cmd>wq<CR>")
u.map("", "<leader>w", "<cmd>w<CR>")

-- Move lines up and down
u.map("n", "<C-A-j>", ":m .+1<CR>==")
u.map("n", "<C-A-Down>", ":m .+1<CR>==")
u.map("n", "<C-A-k>", ":m .-2<CR>==")
u.map("n", "<C-A-Up>", ":m .-2<CR>==")
u.map("i", "<C-A-j>", "<Esc>:m .+1<CR>==gi")
u.map("i", "<C-A-Down>", "<Esc>:m .+1<CR>==gi")
u.map("i", "<C-A-k>", "<Esc>:m .-2<CR>==gi")
u.map("i", "<C-A-Up>", "<Esc>:m .-2<CR>==gi")
u.map("v", "<C-A-j>", ":m '>+1<CR>gv=gv")
u.map("v", "<C-A-Down>", ":m '>+1<CR>gv=gv")
u.map("v", "<C-A-k>", ":m '<-2<CR>gv=gv")
u.map("v", "<C-A-Up>", ":m '<-2<CR>gv=gv")

-- Don't yank deleted text
u.map("n", "<leader>d", '"_d')
u.map("v", "<leader>d", '"_d')
u.map("v", "p", '"_dP')

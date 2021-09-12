local u = require("utils")

vim.g.mapleader = ";"

-- Split navigation
u.map("", { "<A-h>", "<A-Left>" }, "<cmd>wincmd h<CR>")
u.map("", { "<A-j>", "<A-Down>" }, "<cmd>wincmd j<CR>")
u.map("", { "<A-k>", "<A-Up>" }, "<cmd>wincmd k<CR>")
u.map("", { "<A-l>", "<A-Right>" }, "<cmd>wincmd l<CR>")
u.map("", { "<leader><A-h>", "<leader><A-Left>" }, "<cmd>wincmd H<CR>")
u.map("", { "<leader><A-j>", "<leader><A-Down>" }, "<cmd>wincmd J<CR>")
u.map("", { "<leader><A-k>", "<leader><A-Up>" }, "<cmd>wincmd K<CR>")
u.map("", { "<leader><A-l>", "<leader><A-Right>" }, "<cmd>wincmd L<CR>")

-- Splits
u.map("", "<leader>h", ":split<Space>")
u.map("", "<leader>v", ":vsplit<Space>")
u.map("", "<leader>th", "<cmd>split term://$SHELL<CR>")
u.map("", "<leader>tv", "<cmd>vsplit term://$SHELL<CR>")

-- Tabs
u.map("", "<A-q>", "<cmd>tabclose<CR>")
u.map("", "<A-t>", "<cmd>tabnew<CR>")
u.map("n", "<Tab>", "<cmd>tabnext<CR>")
u.map("n", "<S-Tab>", "<cmd>tabprev<CR>")

-- Replace alias
u.map("", "S", ":%s//gI<Left><Left><Left>", {})

-- Quit
u.map("", "<C-q>", "<cmd>q<CR>")
u.map("", "<leader>qq", "<cmd>q<CR>")
u.map("", "<leader>qw", "<cmd>wq<CR>")
u.map("", "<leader>W", "<cmd>w<CR>")

-- Clear highlight with Esc
u.map("n", "<Esc>", ":noh <CR>")

-- Easier movement between wrapped lines
u.map("", { "j", "<Down>" }, 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
u.map("", { "k", "<Up>" }, 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- Insert mode movement
u.map("i", "<C-a>", "<Home>")
u.map("i", "<C-h>", "<Left>")
u.map("i", "<C-j>", "<Down>")
u.map("i", "<C-k>", "<Up>")
u.map("i", "<C-l>", "<Right>")
u.map("i", "<C-e>", "<End>")

-- Move lines up and down
u.map("n", { "<C-A-j>", "<C-A-Down>" }, ":m .+1<CR>==")
u.map("v", { "<C-A-j>", "<C-A-Down>" }, ":m '>+1<CR>gv=gv")
u.map("i", { "<C-A-j>", "<C-A-Down>" }, "<Esc>:m .+1<CR>==gi")
u.map("n", { "<C-A-k>", "<C-A-Up>" }, ":m .-2<CR>==")
u.map("v", { "<C-A-k>", "<C-A-Up>" }, ":m '<-2<CR>gv=gv")
u.map("i", { "<C-A-k>", "<C-A-Up>" }, "<Esc>:m .-2<CR>==gi")

-- Don't yank deleted text
u.map("v", "p", '"_dP')
u.map({ "n", "v" }, "x", '"_x')
-- u.map({ "n", "v" }, "dd", '"_dd')

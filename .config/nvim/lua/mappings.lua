local u = require("utils")

vim.g.mapleader = ";"

-- Split navigation
u.map("", { "<A-h>", "<A-Left>" }, "<cmd>wincmd h<CR>", { label = "Go to the left window" })
u.map("", { "<A-j>", "<A-Down>" }, "<cmd>wincmd j<CR>", { label = "Go to the window below" })
u.map("", { "<A-k>", "<A-Up>" }, "<cmd>wincmd k<CR>", { label = "Go to the window above" })
u.map("", { "<A-l>", "<A-Right>" }, "<cmd>wincmd l<CR>", { label = "Go to the right window" })
u.map("", { "<leader><A-h>", "<leader><A-Left>" }, "<cmd>wincmd H<CR>", { label = "Move window to the left side" })
u.map("", { "<leader><A-j>", "<leader><A-Down>" }, "<cmd>wincmd J<CR>", { label = "Move window to bottom" })
u.map("", { "<leader><A-k>", "<leader><A-Up>" }, "<cmd>wincmd K<CR>", { label = "Move window to top" })
u.map("", { "<leader><A-l>", "<leader><A-Right>" }, "<cmd>wincmd L<CR>", { label = "Move window to the right side" })

-- Splits
u.map("", "<leader>h", ":split<Space>", { label = "Open a horizontal split", silent = false })
u.map("", "<leader>v", ":vsplit<Space>", { label = "Open a vertical split", silent = false })
u.map("", "<leader>th", "<cmd>split term://$SHELL<CR>", { label = "Open a terminal in a horizontal split" })
u.map("", "<leader>tv", "<cmd>vsplit term://$SHELL<CR>", { label = "Open a terminal in a vertical split" })

-- Tabs
u.map("", "<A-q>", "<cmd>tabclose<CR>", { label = "Close the tab" })
u.map("", "<A-t>", "<cmd>tabnew<CR>", { label = "Open a new tab" })
u.map("n", "<A-Tab>", "<cmd>tabnext<CR>", { label = "Switch to the next tab" })
-- u.map("n", "<S-Tab>", "<cmd>tabprev<CR>", { label = "Switch to previous tab" })

-- Replace alias
u.map("", "S", ":%s//gI<Left><Left><Left>", { label = "Replace", silent = false })

-- Quit
u.map("", { "<leader>qq", "<C-q>" }, "<cmd>q<CR>", { label = "Close current buffer" })
u.map("", "<leader>qw", "<cmd>wq<CR>", { label = "Save and close current buffer" })
u.map("", "<leader>W", "<cmd>w<CR>", { label = "Save current buffer" })

-- Clear highlights with Esc
u.map("n", "<Esc>", ":noh <CR>", { label = "Clear highlights" })

-- Easier movement between wrapped lines
u.map("", { "j", "<Down>" }, 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { label = "Move down", expr = true })
u.map("", { "k", "<Up>" }, 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { label = "Move up", expr = true })

-- Insert mode movement
u.map("i", "<C-a>", "<Home>", { label = "I: same as 0" })
u.map("i", "<C-h>", "<Left>", { label = "I: same as h" })
u.map("i", "<C-j>", "<Down>", { label = "I: same as j" })
u.map("i", "<C-k>", "<Up>", { label = "I: same as k" })
u.map("i", "<C-l>", "<Right>", { label = "I: same as l" })
u.map("i", "<C-d>", "<End>", { label = "I: same as $" })

-- Move lines up and down
u.map("n", { "<C-A-j>", "<C-A-Down>" }, ":m .+1<CR>==", { label = "Move the line down" })
u.map("v", { "<C-A-j>", "<C-A-Down>" }, ":m '>+1<CR>gv=gv", { label = "Move selected lines down" })
u.map("i", { "<C-A-j>", "<C-A-Down>" }, "<Esc>:m .+1<CR>==gi", { label = "Move the line down" })
u.map("n", { "<C-A-k>", "<C-A-Up>" }, ":m .-2<CR>==", { label = "Move the line up" })
u.map("v", { "<C-A-k>", "<C-A-Up>" }, ":m '<-2<CR>gv=gv", { label = "Move selected lines up" })
u.map("i", { "<C-A-k>", "<C-A-Up>" }, "<Esc>:m .-2<CR>==gi", { label = "Move the line down" })

-- Don't yank deleted text
u.map("v", "p", '"_dP', { label = "Paste without yanking" })
u.map({ "n", "v" }, "x", '"_x', { label = "Delete without yanking" })
-- u.map({ "n", "v" }, "dd", '"_dd')

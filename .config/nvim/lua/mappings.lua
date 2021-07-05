vim.g.mapleader = ";"

-- Split navigation
map("", "<A-h>", "<cmd>wincmd h<CR>", { noremap = true, silent = true })
map("", "<A-Left>", "<cmd>wincmd h<CR>", { noremap = true, silent = true })
map("", "<A-k>", "<cmd>wincmd k<CR>", { noremap = true, silent = true })
map("", "<A-Up>", "<cmd>wincmd k<CR>", { noremap = true, silent = true })
map("", "<A-j>", "<cmd>winmd j<CR>", { noremap = true, silent = true })
map("", "<A-Down>", "<cmd>wincmd j<CR>", { noremap = true, silent = true })
map("", "<A-l>", "<cmd>wincmd l<CR>", { noremap = true, silent = true })
map("", "<A-Right>", "<cmd>wincmd l<CR>", { noremap = true, silent = true })
map("", "<leader><A-h>", "<cmd>wincmd H<CR>", { noremap = true, silent = true })
map("", "<leader><A-Left>", "<cmd>wincmd H<CR>", { noremap = true, silent = true })
map("", "<leader><A-k>", "<cmd>wincmd K<CR>", { noremap = true, silent = true })
map("", "<leader><A-Up>", "<cmd>wincmd K<CR>", { noremap = true, silent = true })
map("", "<leader><A-j>", "<cmd>wincmd J<CR>", { noremap = true, silent = true })
map("", "<leader><A-Down>", "<cmd>wincmd J<CR>", { noremap = true, silent = true })
map("", "<leader><A-l>", "<cmd>wincmd L<CR>", { noremap = true, silent = true })
map("", "<leader><A-Right>", "<cmd>wincmd L<CR>", { noremap = true, silent = true })

-- Splits
map("", "<leader>h", ":split<Space>", { noremap = true, silent = true })
map("", "<leader>v", ":vsplit<Space>", { noremap = true, silent = true })
map("", "<leader>th", "<cmd>split term<cmd>//$SHELL<CR>", { noremap = true, silent = true })
map("", "<leader>tv", "<cmd>vsplit term<cmd>//$SHELL<CR>", { noremap = true, silent = true })

-- Tabs
map("", "<A-Tab>", "<cmd>tabnext<CR>", { noremap = true, silent = true })
map("", "<A-w>", "<cmd>tabclose<CR>", { noremap = true, silent = true })
map("", "<A-t>", "<cmd>tabnew<CR>", { noremap = true, silent = true })

-- Replace alias
map("", "S", ":%s//gI<Left><Left><Left>", {})

-- Quit
map("", "<C-q>", "<cmd>q<CR>", {})
map("", "<C-Q>", "<cmd>q!<CR>", {})
map("", "<leader>x", "<cmd>q<CR>", {})
map("", "<leader>wq", "<cmd>wq<CR>", {})
map("", "<leader>w", "<cmd>w<CR>", {})

-- Move lines up and down
map("n", "<C-A-j>", "<cmd>m .+1<CR>==", { noremap = true, silent = true })
map("n", "<C-A-Down>", "<cmd>m .+1<CR>==", { noremap = true, silent = true })
map("n", "<C-A-k>", "<cmd>m .-2<CR>==", { noremap = true, silent = true })
map("n", "<C-A-Up>", "<cmd>m .-2<CR>==", { noremap = true, silent = true })
map("i", "<C-A-j>", "<Esc><cmd>m .+1<CR>==gi", { noremap = true, silent = true })
map("i", "<C-A-Down>", "<Esc><cmd>m .+1<CR>==gi", { noremap = true, silent = true })
map("i", "<C-A-k>", "<Esc><cmd>m .-2<CR>==gi", { noremap = true, silent = true })
map("i", "<C-A-Up>", "<Esc><cmd>m .-2<CR>==gi", { noremap = true, silent = true })
map("v", "<C-A-j>", "<cmd>m '>+1<CR>gv=gv", { noremap = true, silent = true })
map("v", "<C-A-Down>", "<cmd>m '>+1<CR>gv=gv", { noremap = true, silent = true })
map("v", "<C-A-k>", "<cmd>m '<-2<CR>gv=gv", { noremap = true, silent = true })
map("v", "<C-A-Up>", "<cmd>m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Don't yank deleted text
map("n", "<leader>d", '"_d', { noremap = true, silent = true })
map("v", "<leader>d", '"_d', { noremap = true, silent = true })
map("v", "p", '"_dP', { noremap = true, silent = true })

local u = require("utils")

u.map("n", "<leader>ft", "<cmd>Telescope resume<cr>")
u.map("n", "<leader>ff", "<cmd>Telescope fd<cr>")
u.map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
u.map("n", "<leader>fg", "<cmd>Telescope grep_string<cr>")
u.map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>")
u.map("n", "<leader>fhs", "<cmd>Telescope search_history<cr>")
u.map("n", "<leader>fhc", "<cmd>Telescope command_history<cr>")

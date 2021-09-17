local u = require("utils")

u.map("n", "<leader>ft", "<cmd>Telescope resume<cr>", { label = "Telescope: Resume" })
u.map("n", "<leader>ff", "<cmd>Telescope fd<cr>", { label = "Telscope: Files" })
u.map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { label = "Telescope: Buffers" })
u.map("n", "<leader>fg", "<cmd>Telescope grep_string<cr>", { label = "Telescope: Grep" })
u.map("n", "<leader>fhs", "<cmd>Telescope search_history<cr>", { label = "Telescope: Search history" })
u.map("n", "<leader>fhc", "<cmd>Telescope command_history<cr>", { label = "Telescope: Command history" })

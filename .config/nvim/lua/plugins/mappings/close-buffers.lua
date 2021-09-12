local u = require("utils")

u.map("n", { "<leader>qc", "<leader>qa" }, "<Cmd>BWipeout all<CR>")
u.map("n", "<leader>qo", "<Cmd>BWipeout other<CR>")

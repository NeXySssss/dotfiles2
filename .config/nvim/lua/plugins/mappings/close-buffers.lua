local u = require("utils")

u.map("n", { "<leader>qc", "<leader>qa" }, "<Cmd>BWipeout all<CR>", { label = "Close all buffers" })
u.map("n", "<leader>qo", "<Cmd>BWipeout other<CR>", { label = "Close other buffers" })

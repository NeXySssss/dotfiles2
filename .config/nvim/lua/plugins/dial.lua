local u = require("utils")

u.map("n", "<C-a>", "<Plug>(dial-increment)", { silent = true })
u.map("n", "<C-x>", "<Plug>(dial-decrement)", { silent = true })
u.map("v", "<C-a>", "<Plug>(dial-increment)", { silent = true })
u.map("v", "<C-x>", "<Plug>(dial-decrement)", { silent = true })
u.map("v", "g<C-a>", "<Plug>(dial-increment-additional)", { silent = true })
u.map("v", "g<C-x>", "<Plug>(dial-decrement-additional)", { silent = true })

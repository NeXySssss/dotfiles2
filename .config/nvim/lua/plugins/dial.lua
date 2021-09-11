local u = require("utils")

local s = { silent = true }

u.map("n", "<C-a>", "<Plug>(dial-increment)", s)
u.map("n", "<C-x>", "<Plug>(dial-decrement)", s)
u.map("v", "<C-a>", "<Plug>(dial-increment)", s)
u.map("v", "<C-x>", "<Plug>(dial-decrement)", s)
u.map("v", "g<C-a>", "<Plug>(dial-increment-additional)", s)
u.map("v", "g<C-x>", "<Plug>(dial-decrement-additional)", s)

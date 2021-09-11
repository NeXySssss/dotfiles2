local u = require("utils")

require("todo-comments").setup({})

u.map("n", "<leader>xt", "<cmd>TodoTrouble<cr>")

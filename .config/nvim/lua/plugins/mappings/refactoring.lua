local u = require("utils")

u.map("v", "<Leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]])
u.map("v", "<Leader>ref", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]])
u.map("v", "<Leader>rt", [[ <Esc><Cmd>lua refactors()<CR>]])

local u = require("utils")

u.map("v", "<Leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Refactoring: Extract function')<CR>]], { label = "Extract function" })
u.map(
	"v",
	"<Leader>ref",
	[[ <Esc><Cmd>lua require('refactoring').refactor('Refactoring: Extract function to file')<CR>]],
	{ label = "Extract function to file" }
)
u.map("v", "<Leader>rl", [[ <Esc><Cmd>lua refactors()<CR>]], { label = "Refactoring: Available refactors" })

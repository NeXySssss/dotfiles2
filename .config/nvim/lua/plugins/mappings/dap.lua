local u = require("utils")

u.map("n", { "<leader>dc", "<F5>" }, "<cmd>lua require'dap'.continue()<CR>", { label = "DAP: Continue" })
u.map("n", { "<leader>dsi", "<F11>" }, "<cmd>lua require'dap'.step_into()<CR>", { label = "DAP: Step into" })
u.map("n", { "<leader>dso", "<F10>" }, "<cmd>lua require'dap'.step_over()<CR>", { label = "DAP: Step over" })
u.map("n", { "<leader>dsO", "<F12>" }, "<cmd>lua require'dap'.step_out()<CR>", { label = "DAP: Step out" })
u.map("n", { "<leader>db", "<F8>" }, "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { label = "DAP: Toggle breakpoint" })
u.map(
	"n",
	"<leader>dB",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ label = "DAP: Set conditional breakpoint" }
)
u.map("n", "<leader>dl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", { label = "DAP: Set log point" })
u.map("n", "<leader>dro", "<cmd>lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l", { label = "DAP: Open repl" })
u.map("n", "<leader>drl", "<cmd>lua require'dap'.repl.run_last()<CR>", { label = "DAP: Run last in repl" })
u.map("n", "<leader>di", "<cmd>lua require'dap.ui.variables'.hover(function () return vim.fn.expand(\"<cexpr>\") end)<CR>", { label = "DAP: Hover" })
u.map("n", "<leader>d?", "<cmd>lua require'dap.ui.variables'.scopes()<CR>", { label = "DAP: Scopes" })
u.map("n", "<leader>de", "<cmd>lua require'dap'.set_exception_breakpoints({\"all\"})<CR>", { label = "DAP: Set exception breakpoints" })

u.map("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", { label = "DAP: Toggle UI" })

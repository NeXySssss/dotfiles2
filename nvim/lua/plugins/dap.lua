local dap = require'dap'
local opts = {noremap = true, silent = true}
vim.g.dap_virtual_text = true

-- require'dap.ext.vscode'.load_launchjs()

dap.adapters.node2 = {
	type = 'executable',
	command = 'node',
	args = {
		os.getenv('HOME') ..
						'/Documents/cloned/vscode-node-debug2/out/src/nodeDebug.js'
	}
}

dap.configurations.javascript = {
	{
		type = 'node2',
		request = 'launch',
		program = '${workspaceFolder}/main.js',
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = 'inspector',
		console = 'integratedTerminal'
	}
}

dap.adapters.netcoredbg = {
	type = 'executable',
	command = '/home/marko/Downloads/netcoredbg/netcoredbg',
	args = {'--interpreter=vscode --attach ${processId}'},
	options = {cwd = "/home/marko/Downloads/netcoredbg"}
}
--
--[[ dap.adapters.netcoredbg = {
	type = 'server',
	port = 4711
} ]]

dap.configurations.cs = {
	{
		type = 'netcoredbg',
		request = 'launch',
		name = 'Netcoredbg',
		program = '${workspaceFolder}/bin/Debug/netcoreapp3.1/Uniview.Server',
		cwd = '${workspaceFolder}'
	}
}
--[[ dap.adapters.cs = {
	type = 'server',
	port = 61564
} ]]
--[[ dap.configurations.cs = {
	{
		type = "netcoredbg",
		request = "launch",
		program = "dotnet",
		args = {"run"},
		-- stopAtEntry = true,
		cwd = "${workspaceFolder}"
	}
} ]]

map('n', '<F5>', '<cmd>lua require\'dap\'.continue()<CR>', opts)
map('n', '<F10>', '<cmd>lua require\'dap\'.step_over()<CR>', opts)
map('n', '<F11>', '<cmd>lua require\'dap\'.step_into()<CR>', opts)
map('n', '<F12>', '<cmd>lua require\'dap\'.step_out()<CR>', opts)
map('n', '<leader>db', '<cmd>lua require\'dap\'.toggle_breakpoint()<CR>', opts)
map('n', '<leader>dB',
    '<cmd>lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>',
    opts)
map('n', '<leader>dlp',
    '<cmd>lua require\'dap\'.set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>',
    opts)
map('n', '<leader>dr',
    '<cmd>lua require\'dap\'.repl.open({}, \'vsplit\')<CR><C-w>l', opts)
map('n', '<leader>dl', '<cmd>lua require\'dap\'.repl.run_last()<CR>', opts)
map('n', '<leader>di',
    '<cmd>lua require\'dap.ui.variables\'.hover(function () return vim.fn.expand("<cexpr>") end)<CR>',
    opts)
map('n', '<leader>d?', '<cmd>lua require\'dap.ui.variables\'.scopes()<CR>', opts)
map('n', '<leader>de',
    '<cmd>lua require\'dap\'.set_exception_breakpoints({"all"})<CR>', opts)

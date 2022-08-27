return function(modules, buffer)
	-- TODO: Maybe move everything to <leader>l
	modules.utils.set_maps({
		{ "n", "gdd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" } },
		{ "n", "gdt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "Go to type definition" } },
		{ "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration" } },
		{ "n", "gi", "<cmd>lua vim.lsp.buf.implementation()", { desc = "Go to implementation" } },
		{ "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "References" } },
		{ "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Documentation" } },
		{ "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Show signature help" } },
		{ "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" } },
		{ "n", "<leader>ra", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code Actions" } },
		{ "n", "<leader>rf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { desc = "Format" } },
		{ "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { desc = "Add workspace folder" } },
		{
			"n",
			"<leader>wr",
			"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
			{ desc = "Remove workspace folder" },
		},
		{
			"n",
			"<leader>wl",
			"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
			{ desc = "List workspace folders" },
		},
	}, { desc = "LSP", buffer = buffer })

	modules.utils.set_map_group("<leader>r", "Refactor")
end

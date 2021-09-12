local map = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

-- See `:help vim.lsp.*` for documentation on any of the below functions
return function(bufnr)
	map(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	map(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

	map(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	map(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	map(bufnr, "n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)

	map(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	map(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	map(bufnr, "n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)

	map(bufnr, "n", "<leader>twd", "<Cmd>Telescope lsp_workspace_diagnostics<CR>", opts)
	map(bufnr, "n", "<leader>tdd", "<Cmd>Telescope lsp_document_diagnostics<CR>", opts)

	map(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	map(bufnr, "n", "<leader>rf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	map(bufnr, "n", "<leader>ra", "<Cmd>Telescope lsp_code_actions<CR>", opts)
	map(bufnr, "n", "<leader>rra", "<Cmd>Telescope lsp_range_code_actions<CR>", opts)

	map(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	map(bufnr, "n", "gd", "<Cmd>Telescope lsp_definitions<CR>", opts)
	map(bufnr, "n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
	map(bufnr, "n", "gr", "<Cmd>Telescope lsp_references<CR>", opts)
	map(bufnr, "n", "<leader>gd", "<Cmd>Telescope lsp_type_definitions<CR>", opts)

	map(bufnr, "n", "<leader>tws", "<Cmd>Telescope lsp_workspace_symbols<CR>", opts)
	map(bufnr, "n", "<leader>tds", "<Cmd>Telescope lsp_document_symbols<CR>", opts)

	-- Toggle the aerial window
	map(bufnr, "n", "<leader>a", "<cmd>AerialToggle!<CR>", opts)
	-- Jump forwards/backwards
	map(bufnr, "n", "{", "<cmd>AerialPrev<CR>", opts)
	map(bufnr, "n", "}", "<cmd>AerialNext<CR>", opts)
	-- Jump up the tree
	map(bufnr, "n", "[[", "<cmd>AerialPrevUp<CR>", opts)
	map(bufnr, "n", "]]", "<cmd>AerialNextUp<CR>", opts)
end

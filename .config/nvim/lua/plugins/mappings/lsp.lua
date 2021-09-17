local u = require("utils")

-- See `:help vim.lsp.*` for documentation on any of the below functions
return function(buffer)
	u.map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { label = "LSP: Hover", buffer = buffer })
	u.map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { label = "LSP: Signature help", buffer = buffer })

	u.map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { label = "LSP: Add workspace folder", buffer = buffer })
	u.map("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", { label = "LSP: Remove workspace folder", buffer = buffer })
	u.map(
		"n",
		"<leader>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		{ label = "LSP: List workspace folders", buffer = buffer }
	)

	u.map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", { label = "LSP: Go to previous diagnostic", buffer = buffer })
	u.map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", { label = "LSP: Go to next diagnostic", buffer = buffer })
	u.map("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", { label = "LSP: Show line diagnostics", buffer = buffer })

	u.map("n", "<leader>twd", "<Cmd>Telescope lsp_workspace_diagnostics<CR>", { label = "LSP: Show workspace diagnostics", buffer = buffer })
	u.map("n", "<leader>tdd", "<Cmd>Telescope lsp_document_diagnostics<CR>", { label = "LSP: Show document diagnostics", buffer = buffer })

	u.map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { label = "LSP: Rename symbol", buffer = buffer })
	u.map("n", "<leader>rf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { label = "LSP: Format document", buffer = buffer })
	u.map("n", "<leader>ra", "<Cmd>Telescope lsp_code_actions<CR>", { label = "LSP: Code actions", buffer = buffer })
	u.map("n", "<leader>rra", "<Cmd>Telescope lsp_range_code_actions<CR>", { label = "LSP: Range code actions", buffer = buffer })

	u.map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", { label = "LSP: Go to declaration", buffer = buffer })
	u.map("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", { label = "LSP: Definitions", buffer = buffer })
	u.map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { label = "LSP: Implementations", buffer = buffer })
	u.map("n", "gr", "<Cmd>Telescope lsp_references<CR>", { label = "LSP: References", buffer = buffer })
	u.map("n", "<leader>gd", "<Cmd>Telescope lsp_type_definitions<CR>", { label = "LSP: Type definitions", buffer = buffer })

	u.map("n", "<leader>tws", "<Cmd>Telescope lsp_workspace_symbols<CR>", { label = "LSP: Workspace symbols", buffer = buffer })
	u.map("n", "<leader>tds", "<Cmd>Telescope lsp_document_symbols<CR>", { label = "LSP: Document symbols", buffer = buffer })

	-- Toggle the aerial window
	u.map("n", "<leader>A", "<cmd>AerialToggle!<CR>", { label = "Toggle Aerial LSP symbols outline", buffer = buffer })
	-- Jump forwards/backwards
	-- u.map("n", "{", "<cmd>AerialPrev<CR>", { label = "LSP: ", buffer = buffer })
	-- u.map("n", "}", "<cmd>AerialNext<CR>", { label = "LSP: ", buffer = buffer })
	-- Jump up the tree
	-- u.map("n", "[[", "<cmd>AerialPrevUp<CR>", { label = "LSP: ", buffer = buffer })
	-- u.map("n", "]]", "<cmd>AerialNextUp<CR>", { label = "LSP: ", buffer = buffer })
end

require("trouble").setup({
	auto_preview = false
})
map("n", "<leader>tt", "<cmd>Trouble<cr>", { silent = true, noremap = true })
map("n", "<leader>tw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", { silent = true, noremap = true })
map("n", "<leader>td", "<cmd>Trouble lsp_document_diagnostics<cr>", { silent = true, noremap = true })
map("n", "gR", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })

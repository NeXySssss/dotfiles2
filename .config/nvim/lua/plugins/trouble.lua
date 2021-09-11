local u = require("utils")

require("trouble").setup({
	auto_preview = false
})

u.map("n", "<leader>tt", "<cmd>Trouble<cr>")
u.map("n", "<leader>tw", "<cmd>Trouble lsp_workspace_diagnostics<cr>")
u.map("n", "<leader>td", "<cmd>Trouble lsp_document_diagnostics<cr>")
u.map("n", "gR", "<cmd>Trouble lsp_references<cr>")

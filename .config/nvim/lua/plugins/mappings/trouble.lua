local u = require("utils")

u.map("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
u.map("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>")
u.map("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>")
u.map("n", "gR", "<cmd>Trouble lsp_references<cr>")

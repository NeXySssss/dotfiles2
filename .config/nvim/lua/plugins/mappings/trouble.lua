local u = require("utils")

u.map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { label = "Trouble: Toggle" })
u.map("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", { label = "Trouble: Workspace diagnostics" })
u.map("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", { label = "Trouble: Document diagnostics" })

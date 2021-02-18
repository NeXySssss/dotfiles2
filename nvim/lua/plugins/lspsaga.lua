require'lspsaga'.init_lsp_saga()
local opts = {noremap = true, silent = true}

-- lsp provider to find the cursor word definition and reference
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
-- code action
map("n", "<leader>a", "<cmd>Lspsaga code_action<CR>", opts)
map("v", "<leader>a", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)
-- hover doc
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
map("n", "<C-f>",
    "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
map("n", "<C-b>",
    "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
-- show signature help
map("n", "gs", "<cmd>Lspsaga signature_help<CR>", opts)
-- rename
map("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
-- preview definition
map("n", "gd", "<cmd>Lspsaga preview_definition<CR>", opts)
-- show line diagnostics
map("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
-- jump diagnostics
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
-- float terminal
map("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", opts)
map("t", "<A-d>", "<C-\\><C-n><cmd>Lspsaga close_floaterm<CR>", opts)

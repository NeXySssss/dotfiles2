return function(modules, buffer)
	local gs = package.loaded.gitsigns

	modules.utils.set_maps({
		{ { "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" } },
		{ { "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" } },
		{ "n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo stage hunk" } },
		{ "n", "<leader>gS", gs.stage_buffer, { desc = "Stage buffer" } },
		{ "n", "<leader>gR", gs.reset_buffer, { desc = "Reset buffer" } },
		{ "n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk" } },
		{ "n", "<leader>gtd", gs.toggle_deleted, { desc = "Toggle deleted" } },
		{ "n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "Toggle current line blame" } },
		{
			"n",
			"<leader>gb",
			function()
				gs.blame_line { full = true }
			end,
			{ desc = "Blame line" },
		},
		{ "n", "<leader>gd", gs.diffthis, { desc = "Diff this" } },
		{
			"n",
			"<leader>gD",
			function()
				gs.diffthis("~")
			end,
			{ desc = "Diff this ~" },
		},
	}, { desc = "Gitsigns", buffer = buffer })

	modules.utils.set_map_group("<leader>g", "Gitsigns")
end

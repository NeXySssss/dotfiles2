local function plugins(use)
	use { "folke/which-key.nvim" }
end

-- TODO: Clean up which-key descriptions, it's a mess

local function preload(modules)
	-- HACK: from https://github.com/folke/which-key.nvim/pull/305
	-- NOTE: https://github.com/neovim/neovim/pull/19185
	local wk_view = require("which-key.view")
	wk_view.hide = function()
		vim.api.nvim_echo({ { "" } }, false, {})
		vim.cmd("redraw")
		wk_view.hide_cursor()
		if wk_view.buf and vim.api.nvim_buf_is_valid(wk_view.buf) then
			vim.api.nvim_buf_delete(wk_view.buf, { force = true })
			wk_view.buf = nil
		end
		if wk_view.win and vim.api.nvim_win_is_valid(wk_view.win) then
			vim.api.nvim_win_close(wk_view.win, { force = true })
			wk_view.win = nil
		end
	end

	modules.wk = require("which-key")
	modules.wk.setup()
end

return {
	plugins = plugins,

	preload = preload,
}

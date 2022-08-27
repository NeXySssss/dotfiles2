local stl = require("stl")
local c = require("stl.components")
local u = require("stl.utils")
local colors = require("kkDark.colors")

local M = {}

local vi_mode_colors = {
	n = colors.green_bright,
	i = colors.yellow,
	v = colors.cyan,
	V = colors.cyan,
	["\22"] = colors.cyan,
	c = colors.orange_bright,
	s = colors.purple,
	S = colors.purple,
	["\19"] = colors.purple,
	R = colors.orange_bright,
	r = colors.orange_bright,
	["!"] = colors.red_bright,
	t = colors.red_bright,
}

M.statusline = stl.create(function()
	if u.is_win_active() then
		local git = c.round_blocks {
			side = "right",
			{ bg = colors.gray, c.git_status("head") },
			{ bg = colors.green, fg = colors.bg, c.git_status("added") },
			{ bg = colors.yellow, fg = colors.bg, c.git_status("changed") },
			{ bg = colors.red, c.git_status("removed") },
		}

		local lsp = c.non_empty {
			{ bg = colors.red, c.diagnostics("error") },
			{ bg = colors.yellow, fg = colors.bg, c.diagnostics("warn") },
			{ bg = colors.blue_dark, c.diagnostics("info") },
			{ bg = colors.blue_darker, c.diagnostics("hint") },
		}

		if not git then
			lsp.side = "right"
		end

		lsp = c.round_blocks(lsp)

		return {
			fg = colors.fg,
			bg = colors.bg,
			c.vi_mode(vi_mode_colors),
			c.round_blocks {
				side = "left",
				{
					bg = colors.gray,
					c.join {
						c.file_icon(),
						c.file_name(),
						c.file_modified(),
						c.file_readonly(),
					},
				},
				{ bg = colors.black_bright, c.context() },
				{ bg = colors.black, c.file_size() },
			},
			c.spacer,
			lsp,
			(lsp and git) and c.spacer,
			git,
		}
	else
		return {
			bg = colors.bg,
			c.round_blocks {
				side = "left",
				{
					bg = colors.gray,
					c.join {
						c.file_icon(),
						c.file_name(),
						c.file_modified(),
						c.file_readonly(),
					},
				},
				{ bg = colors.black_bright, c.context() },
				{ bg = colors.black, c.file_size() },
			},
			c.spacer,
		}
	end
end)

M.winbar = stl.create(function()
	return {
		bg = colors.bg,
		c.spacer,
	}
end)

vim.opt.statusline = "%{%v:lua.require'kvim.modules.ui.statusline'.statusline()%}"

return M

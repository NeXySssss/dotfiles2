local lsp = require("feline.providers.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")

local colors = require("kkDark.colors")
local codicons = require("codicons")
local lsp_status = require("lsp-status")

local vi_mode_color = {
	n = colors.fg,
	no = colors.fg,
	i = colors.green_bright,
	v = colors.cyan,
	V = colors.cyan,
	[""] = colors.cyan_bright,
	c = colors.orange_bright,
	cv = colors.orange_bright,
	ce = colors.orange_bright,
	R = colors.red,
	Rv = colors.red,
	s = colors.magenta,
	S = colors.magenta,
	[""] = colors.magenta,
	t = colors.fg,
}

local b = vim.b
local fn = vim.fn

local M = {}

local vi_mode_alias = {
	n = "N",
	no = "N",
	i = "I",
	v = "V",
	V = "L",
	[""] = "B",
	c = "C",
	cv = "C",
	ce = "C",
	R = "R",
	Rv = "R",
	s = "S",
	S = "S",
	[""] = "S",
	t = "T",
}

M.vi_mode = {
	provider = function()
		return " " .. vi_mode_alias[vim.fn.mode()] .. " "
	end,
	hl = function()
		return {
			name = vi_mode_utils.get_mode_highlight_name(),
			fg = colors.black,
			bg = vi_mode_color[vim.fn.mode()] or colors.fg,
			style = "bold",
		}
	end,
	right_sep = "",
}

M.file_type = {
	provider = "file_type",
	hl = { fg = colors.fg, bg = colors.gray_dark, style = "bold" },
	left_sep = { str = "█", hl = { fg = colors.gray_dark } },
	right_sep = { str = " ", hl = { bg = colors.gray_dark } },
}

M.file_info = {
	provider = "file_info",
	hl = { fg = colors.fg, bg = colors.gray_dark, style = "bold" },
	left_sep = { str = " ", hl = { bg = colors.gray_dark } },
	right_sep = { str = " ", hl = { fg = colors.gray_dark } },
}

M.file_size = {
	provider = "file_size",
	enabled = function()
		return fn.getfsize(fn.expand("%:p")) > 0
	end,
	right_sep = { " ", "slant_left_2_thin" },
}

M.position = {
	provider = "position",
	left_sep = " ",
	right_sep = { " ", "slant_left_2_thin" },
}

M.diagnostic_errors = {
	provider = "diagnostic_errors",
	enabled = function()
		return lsp.diagnostics_exist("Error")
	end,
	hl = { fg = colors.red_bright },
	left_sep = " ",
	icon = codicons.get("error") .. " ",
}

M.diagnostic_warnings = {
	provider = "diagnostic_warnings",
	enabled = function()
		return lsp.diagnostics_exist("Warning")
	end,
	hl = { fg = colors.yellow_bright },
	left_sep = " ",
	icon = codicons.get("warning") .. " ",
}

M.diagnostic_hints = {
	provider = "diagnostic_hints",
	enabled = function()
		return lsp.diagnostics_exist("Hint")
	end,
	hl = { fg = colors.fg },
	left_sep = " ",
	icon = codicons.get("info") .. " ",
}

M.diagnostic_info = {
	provider = "diagnostic_info",
	enabled = function()
		return lsp.diagnostics_exist("Information")
	end,
	hl = { fg = colors.fg },
	left_sep = " ",
	icon = codicons.get("info") .. " ",
}

function lsp_messages()
	local m = lsp_status.messages()
	local str = ""
	for _, v in ipairs(m) do
		if v.name then
			str = str .. "[" .. v.name .. "]"
		end
		if v.title then
			str = str .. " " .. v.title
		end
		if v.percentage then
			str = str .. " (" .. v.percentage .. "%%)"
		end
		if v.message then
			str = str .. ": " .. v.message
		end
		str = str .. " "
	end
	return str
end

M.lsp_messages = {
	provider = lsp_messages,
	left_sep = " ",
	right_sep = " ",
	hl = { fg = colors.yellow },
}

M.git_branch = {
	provider = "git_branch",
	hl = { style = "bold" },
	right_sep = function()
		if b.gitsigns_status_dict then
			return " "
		else
			return ""
		end
	end,
	icon = codicons.get("git-branch") .. " ",
}

M.git_diff_added = {
	provider = "git_diff_added",
	hl = { fg = colors.green },
	icon = " +",
}

M.git_diff_changed = {
	provider = "git_diff_changed",
	hl = { fg = colors.yellow },
	icon = " ~",
}

M.git_diff_removed = {
	provider = "git_diff_removed",
	hl = { fg = colors.red_bright },
	right_sep = function()
		if b.gitsigns_status_dict then
			return " "
		else
			return ""
		end
	end,
	icon = " -",
}
M.line_percentage = {
	provider = "line_percentage",
	hl = { style = "bold" },
	left_sep = "  ",
	right_sep = " ",
}

M.scroll_bar = { provider = "scroll_bar", hl = { fg = "skyblue", style = "bold" } }
return M

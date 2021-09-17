local uv = vim.loop
local lsputil_ok, lsputil = pcall(require, "lspconfig.util")
local wk_ok, wk = pcall(require, "which-key")

local M = {}

M.system_name = ""

if vim.fn.has("mac") == 1 then
	M.system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
	M.system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
	M.system_name = "Windows"
end

function M.map_group(keys, label)
	if wk_ok then
		wk.register({
			[keys] = { name = label },
		})
	end
end

function M.map(mode, keys, action, opts)
	if type(mode) == "string" then
		mode = { mode }
	end

	if type(keys) == "string" then
		keys = { keys }
	end

	if opts == nil then
		opts = {}
	end

	local buffer = opts.buffer
	local label = opts.label

	opts.buffer = nil
	opts.label = nil

	opts = vim.tbl_extend("keep", opts, { noremap = true, silent = true })

	for _, mode_value in ipairs(mode) do
		for _, keys_value in ipairs(keys) do
			if buffer == nil then
				vim.api.nvim_set_keymap(mode_value, keys_value, action, opts)
			else
				vim.api.nvim_buf_set_keymap(buffer, mode_value, keys_value, action, opts)
			end
			if label ~= nil and wk_ok then
				wk.register({ [keys_value] = { label } }, { buffer = buffer })
			end
		end
	end
end

function M.exec(text)
	vim.api.nvim_exec(text, false)
end

function M.t(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function M.round(n)
	return math.floor((math.floor(n * 2) + 1) / 2)
end

function M.has(tbl, item)
	for _, value in pairs(tbl) do
		if value == item then
			return true
		end
	end
	return false
end

function M.read_file(path)
	local fd = uv.fs_open(path, "r", 438)
	local stat = uv.fs_fstat(fd)
	local text = uv.fs_read(fd, stat.size, 0)
	uv.fs_close(fd)

	return text
end

function M.read_json(path)
	return vim.fn.json_decode(M.read_file(path))
end

function M.dir_has_file(path, name)
	if not lsputil_ok then
		return false
	end

	return lsputil.path.exists(lsputil.path.join(path, name))
end

function M.dir_has_matching_file(path, pattern)
	for _, value in ipairs(vim.fn.readdir(path)) do
		if value:find(pattern) ~= nil then
			return true
		end
	end
	return false
end

return M

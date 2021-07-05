-- Utils
system_name = ""
if vim.fn.has("mac") == 1 then
	system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
	system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
	system_name = "Windows"
end
map = vim.api.nvim_set_keymap
exec = function(text)
	vim.api.nvim_exec(text, false)
end
t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end
round = function(n)
	return math.floor((math.floor(n * 2) + 1) / 2)
end

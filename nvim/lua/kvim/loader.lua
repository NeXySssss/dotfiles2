local packer = require("packer")

local M = {}

M.module_definitions = {}
M.module_data = {}

local function resolve_order_inner(out, visited, data, key_name, key, value)
	if value and not visited[key] then
		if value[key_name] and #value[key_name] > 0 then
			for _, after_key in ipairs(value[key_name]) do
				resolve_order_inner(out, visited, data, key_name, after_key, data[after_key])
			end
		end
		table.insert(out, value)
	end
	visited[key] = true
end

local function resolve_order(data, key_name)
	local out = {}
	local visited = {}

	for key, value in pairs(data) do
		resolve_order_inner(out, visited, data, key_name, key, value)
	end

	return out
end

local function run_hooks()
	for _, module in ipairs(resolve_order(M.module_definitions, "preload_after")) do
		if module.preload then
			module.preload(M.module_data, M.module_definitions)
		end
	end

	for _, module in ipairs(resolve_order(M.module_definitions, "load_after")) do
		if module.load then
			module.load(M.module_data, M.module_definitions)
		end
	end

	for _, module in ipairs(resolve_order(M.module_definitions, "postload_after")) do
		if module.postload then
			module.postload(M.module_data, M.module_definitions)
		end
	end
end

function M.add(module)
	if type(module) == "table" then
		for _, l in ipairs(module) do
			M.add(l)
		end
		return
	end

	local is_ok, required_module = pcall(require, "kvim.modules." .. module)
	if not is_ok or not type(required_module) == "table" then
		error("Layer " .. module .. " is invalid or not found.")
	end

	required_module.id = module
	M.module_definitions[module] = required_module
end

function M.load(modules)
	if modules then
		M.add(modules)
	end

	for key, module in pairs(M.module_definitions) do
		if module.depends then
			for _, dep in ipairs(module.depends) do
				if not M.module_definitions[dep] then
					error("Layer " .. key .. " depends on " .. dep .. ", but but it is not found!")
				end
			end
		elseif module.conflicts then
			for _, dep in ipairs(module.conflicts) do
				if M.module_definitions[dep] then
					error("Layer " .. key .. " conflicts with " .. dep .. "!")
				end
			end
		end
	end

	packer.startup(function(use, use_rocks)
		use { "wbthomason/packer.nvim" }
		use { "lewis6991/impatient.nvim" }

		for _, module in pairs(M.module_definitions) do
			if module.plugins then
				module.plugins(use, use_rocks, M.module_definitions)
			end
		end
	end)

	if _G.packer_bootstrap then
		vim.api.nvim_create_autocmd("User", {
			pattern = "PackerComplete",
			once = true,
			callback = function()
				run_hooks()
				return true
			end,
		})
		packer.sync()
	else
		run_hooks()
	end
end

return M

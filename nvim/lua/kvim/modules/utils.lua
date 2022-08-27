local function preload(modules)
	local uv = vim.loop
	local wk = modules.wk

	local M = {}

	function M.string_split(str, sep)
		local r = {}
		local i = 1
		local p = 1
		while true do
			local s = str:find(sep, p, true)
			if not s then
				r[i] = str:sub(p)
				break
			end
			r[i] = str:sub(p, s - 1)
			p = s + 1
			i = i + 1
		end
		return r
	end

	function M.set_opts(tbl, scope)
		local opt = {}

		if scope == "global" then
			opt = vim.opt_global
		elseif scope == "local" then
			opt = vim.opt_local
		else
			opt = vim.opt
		end

		for opt_key, opt_value in pairs(tbl) do
			if type(opt_value) == "table" then
				if opt_value.append ~= nil then
					opt[opt_key]:append(opt_value.append)
				elseif opt_value.prepend ~= nil then
					opt[opt_key]:prepend(opt_value.prepend)
				elseif opt_value.remove ~= nil then
					opt[opt_key]:remove(opt_value.remove)
				else
					opt[opt_key] = opt_value
				end
			else
				opt[opt_key] = opt_value
			end
		end
	end

	function M.set_variables(tbl, dict)
		if dict ~= "g" and dict ~= "w" and dict ~= "b" and dict ~= "t" and dict ~= "v" then
			error("Unknown dict: " .. dict)
		end

		for key, value in pairs(tbl) do
			vim[dict][key] = value
		end
	end

	local function langmap_escape(c)
		if c == "," or c == ";" or c == "\\" then
			return "\\" .. c
		end

		return c
	end

	function M.generate_langmap(tbl)
		local lm_pairs = {}

		for to, from_list in M.orderedPairs(tbl) do
			if type(from_list) ~= "table" then
				from_list = { from_list }
			end

			for _, from in ipairs(from_list) do
				table.insert(lm_pairs, langmap_escape(from) .. langmap_escape(to))
			end
		end

		return table.concat(lm_pairs, ",")
	end

	function M.set_langmap(t)
		vim.opt.langmap = M.generate_langmap(t)
	end

	function M.set_map_group(keys, label)
		if wk then
			wk.register {
				[keys] = { name = label },
			}
		end
	end

	function M.set_map_groups(list)
		for _, group in ipairs(list) do
			M.set_map_group(group)
		end
	end

	function M.set_map(mode, keys, action, opts)
		if type(mode) ~= "table" then
			mode = { mode }
		end

		if type(keys) ~= "table" then
			keys = { keys }
		end

		opts = vim.tbl_extend("keep", opts or {}, { silent = true })

		for _, mode_v in ipairs(mode) do
			for _, keys_v in ipairs(keys) do
				vim.keymap.set(mode_v, keys_v, action, opts)
			end
		end
	end

	function M.set_maps(list, opts)
		if opts == nil then
			opts = {}
		end

		for _, mapping in ipairs(list) do
			if opts.desc and mapping[4] and mapping[4].desc then
				mapping[4].desc = "[" .. opts.desc .. "] " .. mapping[4].desc
			end
			mapping[4] = vim.tbl_extend("keep", mapping[4] or {}, opts)
			M.set_map(unpack(mapping))
		end
	end

	function M.has(feature)
		if vim.fn.has(feature) == 1 then
			return true
		else
			return false
		end
	end

	function M.t(str)
		return vim.api.nvim_replace_termcodes(str, true, true, true)
	end

	function M.round(n)
		return math.floor((math.floor(n * 2) + 1) / 2)
	end

	function M.table_includes(tbl, item)
		for _, value in pairs(tbl) do
			if value == item then
				return true
			end
		end
		return false
	end

	function M.read_file(path)
		local fd = assert(uv.fs_open(path, "r", 438))
		local stat = assert(uv.fs_fstat(fd))
		local text = assert(uv.fs_read(fd, stat.size, 0))
		uv.fs_close(fd)

		return text
	end

	function M.read_json(path)
		return vim.fn.json_decode(M.read_file(path))
	end

	--[[
Ordered table iterator, allow to iterate on the natural order of the keys of a
table.

Example:
]]

	local function __genOrderedIndex(t)
		local orderedIndex = {}
		for key in pairs(t) do
			table.insert(orderedIndex, key)
		end
		table.sort(orderedIndex)
		return orderedIndex
	end

	local function orderedNext(t, state)
		-- Equivalent of the next function, but returns the keys in the alphabetic
		-- order. We use a temporary ordered key table that is stored in the
		-- table being iterated.

		local key = nil
		--print("orderedNext: state = "..tostring(state) )
		if state == nil then
			-- the first time, generate the index
			t.__orderedIndex = __genOrderedIndex(t)
			key = t.__orderedIndex[1]
		else
			-- fetch the next value
			for i = 1, #t.__orderedIndex do
				if t.__orderedIndex[i] == state then
					key = t.__orderedIndex[i + 1]
				end
			end
		end

		if key then
			return key, t[key]
		end

		-- no more value to return, cleanup
		t.__orderedIndex = nil
	end

	function M.orderedPairs(t)
		-- Equivalent of the pairs() function on tables. Allows to iterate
		-- in order
		return orderedNext, t, nil
	end

	M.sep = {
		left_round = "",
		left_circle = "",
		left_triangle = "",
		left_triangle_top = "",
		right_round = "",
		right_circle = "",
		right_triangle = "",
		right_triangle_top = "",
	}

	modules.utils = M
end

return {
	preload = preload,
	preload_after = { "which-key" },
}

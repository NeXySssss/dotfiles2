local languages = { "svelte", "html", "vue", "javascript", "tsx" }

local config = {
	single_line_comment_string = "auto",
	multi_line_comment_strings = "auto",
	prefer_single_line_comments = true,
	hook_function = function()
		require("ts_context_commentstring.internal").update_commentstring()
	end,
}

for _, value in ipairs(languages) do
	require("kommentary.config").configure_language(value, config)
end

require("kommentary.config").configure_language("default", {
	prefer_single_line_comments = true,
})

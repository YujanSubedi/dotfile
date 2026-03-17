-- Tab Line:

-- Highlighter Group
vim.cmd("highlight TabLineActive guifg=#007993 guibg=#282828 gui=bold")
vim.cmd("highlight TabLineDefault guifg=#7c7e93 guibg=#151515 gui=bold")

-- Function to get statusline string
function Tabline_value()
	local tabline_string = "%#TabLineDefault#"
	local tabs = vim.api.nvim_list_tabpages()
	local current = vim.api.nvim_get_current_tabpage()

	for i, tab in ipairs(tabs) do
		local win = vim.api.nvim_tabpage_get_win(tab)
		local buf = vim.api.nvim_win_get_buf(win)
		local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
		if name == "" then
			name = "[-]"
		end

		if tab == current then
			tabline_string = tabline_string .. "%#TabLineActive# (" .. i .. ") " .. name .. " %#TabLineDefault#"
		else
			tabline_string = tabline_string .. " (" .. i .. ") " .. name .. " "
		end
	end

	return tabline_string
end

-- Set the tabline as give by the Tabline_value() function
vim.o.tabline = "%{%v:lua.Tabline_value()%}"

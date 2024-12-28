-- Status Line:

-- Display only one statusline
vim.opt.laststatus = 3

-- Show partial command in statusline.
vim.opt.showcmd = true
vim.opt.showcmdloc = "statusline"

-- Highlighter Group
vim.cmd("highlight StatusLineNormal guifg=#1a1c23 guibg=#e45e7c gui=bold")
vim.cmd("highlight StatusLineInsert guifg=#1a1c23 guibg=#25b2bc gui=bold")
vim.cmd("highlight StatusLineVisual guifg=#1a1c23 guibg=#d67229 gui=bold")
vim.cmd("highlight StatusLineCommand guifg=#1a1c23 guibg=#09a780 gui=bold")
vim.cmd("highlight StatusLineDefault guifg=#1a1c23 guibg=#282a36 gui=bold")
vim.cmd("highlight StatusLineGit guifg=#09a780 guibg=#2e303e gui=bold")
vim.cmd("highlight StatusLineFiletype guifg=#008fb3 guibg=#2e303e gui=bold")
vim.cmd("highlight StatusLineOthers guifg=#7c7e93 guibg=#282828 gui=bold")
vim.cmd("highlight StatusLineMacro guifg=#e34a27 guibg=#151515 gui=bold")
vim.cmd("highlight StatusLineErrors guifg=#cf6487 guibg=#151515 gui=italic")
vim.cmd("highlight StatusLineWarnings guifg=#d8ac6a guibg=#151515 gui=italic")
vim.cmd("highlight StatusLineExtra guifg=#a5a2a2 guibg=#151515 gui=bold")

-- Mode Specific values
local Mode_hasmap = {
	n = { name = " NORMAL ", short_name = " N ", highlighter = "%#StatusLineNormal#" },
	v = { name = " VISUAL ", short_name = " V ", highlighter = "%#StatusLineVisual#" },
	V = { name = " V-LINE ", short_name = " V ", highlighter = "%#StatusLineVisual#" },
	i = { name = " INSERT ", short_name = " I ", highlighter = "%#StatusLineInsert#" },
	r = { name = " PROMPT ", short_name = " P ", highlighter = "%#StatusLineInsert#" },
	R = { name = " REPLACE ", short_name = " R ", highlighter = "%#StatusLineInsert#" },
	c = { name = " COMMAND ", short_name = " C ", highlighter = "%#StatusLineCommand#" },
	s = { name = " SELECT ", short_name = " S ", highlighter = "%#StatusLineDefault#" },
	S = { name = " S-LINE ", short_name = " S ", highlighter = "%#StatusLineDefault#" },
	t = { name = " TERMINAL ", short_name = " T ", highlighter = "%#StatusLineDefault#" },
	["\22"] = { name = " V-Block ", short_name = " V ", highlighter = "%#StatusLineVisual#" },
}

-- Function to get name of current mode
local function get_Mode_details()
	local nvim_mode = vim.fn.mode()
	return Mode_hasmap[nvim_mode] or { name = " Unknown ", short_name = " U ", highlighter = "%#StatusLineDefault#" }
end

-- Function to get git branch
local function get_git_branch()
	local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr '\n' ' '")
	if branch ~= "" then
		return "%#StatusLineGit#  " .. branch
	end
	return ""
end

-- Function to get recording register name
local function get_macro_recording()
	local macro_recording = vim.fn.reg_recording()
	if macro_recording ~= "" then
		return "%#StatusLineMacro# " .. macro_recording
	end
	return ""
end

-- Function to get no of errors on diagnostic
local function get_errors()
	local errors = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	if #errors > 0 then
		return "%#StatusLineErrors# " .. string.format("%d ", #errors)
	end
	return ""
end

-- Function to get no of warnings on diagnostic
local function get_warnings()
	local warnings = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	if #warnings > 0 then
		return "%#StatusLineWarnings#" .. string.format(" %d ", #warnings)
	end
	return ""
end

-- Function to get statusline string
function Statusline_value()
	local nvim_length = vim.o.columns
	local mode_details = get_Mode_details()
	local git_branch = get_git_branch()
	local errors = get_errors()
	local warnings = get_warnings()
	local macro_recording = get_macro_recording()
	-- Long length statusline
	if nvim_length > 100 then
		return mode_details.highlighter
			.. mode_details.name
			.. git_branch
			.. "%#StatusLineOthers# %f "
			.. macro_recording
			.. "%#StatusLineExtra# %m"
			.. errors
			.. warnings
			.. "%=%#StatusLineExtra#%S (%{&encoding}) %#StatusLineOthers# %p%% %#StatusLineFiletype# %y "
			.. mode_details.highlighter
			.. " %l:%c "
	end
	-- Medium length statusline
	if nvim_length > 50 then
		return mode_details.highlighter
			.. mode_details.name
			.. git_branch
			.. "%#StatusLineOthers# %.30f "
			.. macro_recording
			.. "%#StatusLineExtra# %m"
			.. errors
			.. warnings
			.. "%=%#StatusLineExtra#%S (%{&encoding}) %#StatusLineOthers# %p%% %#StatusLineFiletype# %y "
			.. mode_details.highlighter
			.. " %l:%c "
	end
	-- Short length statusline
	return mode_details.highlighter
		.. mode_details.short_name
		.. "%#StatusLineOthers# %.12f "
		.. macro_recording
		.. "%#StatusLineExtra# %m"
		.. errors
		.. warnings
		.. "%=%#StatusLineExtra#%S %#StatusLineFiletype# %y "
		.. mode_details.highlighter
		.. " %p%% "
end

-- Set the statusline as give by the Statusline_value() function
vim.o.statusline = "%{%v:lua.Statusline_value()%}"

-- Function to get directories based on parameters
local function get_dirs(include_hidden)
	local cmd = "fd -t d"
	if include_hidden then
		cmd = cmd .. " -H" -- Add flag for hidden directories
	end

	local handle = io.popen(cmd)
	if not handle then
		return {}
	end

	local result = handle:read("*a")
	handle:close()

	local dirs = {}
	for dir in result:gmatch("[^\n]+") do
		table.insert(dirs, dir)
	end
	return dirs
end

-- Create custom picker for directory navigation
local function create_cd_picker(include_hidden)
	vim.ui.select(
		get_dirs(include_hidden), -- List of choices
		{ prompt = "Change Directory to" }, -- Optional configurations
		function(selected_dir, _)
			if selected_dir then
				vim.cmd("cd " .. selected_dir)
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<leader>ff", true, false, true), "m", false)
			end
		end
	)
end

-- Function for current directory (original behavior)
local function cd_picker()
	create_cd_picker(false)
end

-- Function for current directory including hidden directories
local function cd_picker_hidden()
	create_cd_picker(true)
end

-- Function for whole home
local function cd_picker_all()
	vim.cmd("cd ~")
	create_cd_picker(true)
end

-- Function for home directory
local function cd_picker_home()
	vim.cmd("cd ~/Yujan")
	create_cd_picker(false)
end

-- Function for home directory including hidden directories
local function cd_picker_config()
	vim.cmd("cd ~/.config")
	create_cd_picker(true)
end

-- Optional: Add keybindings
vim.keymap.set("n", "<leader>ch", cd_picker, { desc = "Fzf cd" })
vim.keymap.set("n", "<leader>cH", cd_picker_hidden, { desc = "Fzf cd hidden" })
vim.keymap.set("n", "<leader>cD", cd_picker_all, { desc = "Fzf cd Home" })
vim.keymap.set("n", "<leader>cd", cd_picker_home, { desc = "Fzf cd ~/Yujan/" })
vim.keymap.set("n", "<leader>cc", cd_picker_config, { desc = "Fzf cd ~/.config/" })

--- Find nvim files
local function find_nvim_files()
	vim.cmd("cd ~/.config/nvim")
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<leader>ff", true, false, true), "m", false)
end
--- Keybiding to find nvim file
vim.keymap.set("n", "<leader>fn", find_nvim_files, { desc = "Find Config File" })

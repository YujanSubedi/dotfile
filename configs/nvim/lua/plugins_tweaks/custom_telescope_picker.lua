local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local builtin = require("telescope.builtin")

-- Function to get directories based on parameters
local function get_dirs(include_hidden, base_path)
	local cmd = "fd -t d"
	if include_hidden then
		cmd = cmd .. " -H" -- Add flag for hidden directories
	end

	if base_path then
		cmd = cmd .. " . " .. base_path
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
local function create_cd_picker(opts, include_hidden, base_path)
	opts = opts or {}

	pickers
		.new(opts, {
			prompt_title = "Change Directory" .. (include_hidden and " (Including Hidden)" or ""),
			finder = finders.new_table({
				results = get_dirs(include_hidden, base_path),
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, _)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					if selection then
						vim.cmd("cd " .. selection[1])
						-- Run telescope find_files after changing directory
						vim.schedule(function()
							builtin.find_files()
						end)
					end
				end)
				return true
			end,
		})
		:find()
end

-- Function for current directory (original behavior)
local function cd_picker(opts)
	create_cd_picker(opts, false)
end

-- Function for current directory including hidden directories
local function cd_picker_hidden(opts)
	create_cd_picker(opts, true)
end

-- Function for whole home
local function cd_picker_all(opts)
	local home_path = os.getenv("HOME")
	create_cd_picker(opts, true, home_path)
end

-- Function for home directory
local function cd_picker_home(opts)
	local home_path = os.getenv("HOME") .. "/Yujan/"
	create_cd_picker(opts, false, home_path)
end

-- Function for home directory including hidden directories
local function cd_picker_config(opts)
	local config_path = os.getenv("HOME") .. "/.config/"
	create_cd_picker(opts, true, config_path)
end

-- Create commands for all variations
vim.api.nvim_create_user_command("Fzfcd", function()
	cd_picker()
end, {})

vim.api.nvim_create_user_command("FzfcdH", function()
	cd_picker_hidden()
end, {})

-- Optional: Add keybindings
vim.keymap.set("n", "<leader>ch", cd_picker, { desc = "Fzf cd Telescope" })
vim.keymap.set("n", "<leader>cH", cd_picker_hidden, { desc = "Fzf cd hidden Telescope" })
vim.keymap.set("n", "<leader>cD", cd_picker_all, { desc = "Fzf cd Home Telescope" })
vim.keymap.set("n", "<leader>cd", cd_picker_home, { desc = "Fzf cd ~/Yujan/ Telescope" })
vim.keymap.set("n", "<leader>cc", cd_picker_config, { desc = "Fzf cd ~/.config/" })

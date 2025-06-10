return {
	-- Competitive coding tests
	{
		"xeluxee/competitest.nvim",
		cmd = "CompetiTest",
		keys = {
			{ "<leader>te", "<cmd>CompetiTest run<cr>", desc = "Execute testcase" },
			{ "<leader>ti", "<cmd>CompetiTest add_testcase<cr>", desc = "Add testcases" },
			{ "<leader>tt", "<cmd>CompetiTest edit_testcase<cr>", desc = "Edit testcase" },
		},
		opts = {
			editor_ui = {
				normal_mode_mappings = { switch_window = { "<A-i>", "<A-o>", "<leader><Tab>" } },
				insert_mode_mappings = { switch_window = { "<A-i>", "<A-o>" } },
			},
		},
	},

	-- Debug Adapter Protocol
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			{ "jay-babu/mason-nvim-dap.nvim", opts = { handlers = {} } },
		},
		keys = {
			{ "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Add breakpoint at line debugger" },
			{ "<leader>dr", "<cmd>DapContinue<cr>", desc = "Start or continue the debugger" },
			{ "<A-b>", "<cmd>DapToggleBreakpoint<cr>", desc = "Add breakpoint at line debugger" },
			{ "<A-r>", "<cmd>DapContinue<cr>", desc = "Start or continue the debugger" },
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()

			-- Terminate dap and dapui
			vim.keymap.set("n", "<leader>dk", function()
				dap.terminate()
				dapui.close()
			end, { desc = "[D]ebugger [T]erminate" })

			-- Auto start dapui
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			-- Hides tokens, secrets, and other sensitive information, From TJ DeVries' config
			require("nvim-dap-virtual-text").setup({
				display_callback = function(variable)
					local name = string.lower(variable.name)
					local value = string.lower(variable.value)
					if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
						return "*****"
					end
					if #variable.value > 15 then
						return " " .. string.sub(variable.value, 1, 15) .. "... "
					end
					return " " .. variable.value
				end,
			})
		end,
	},
}

return {
	-- Competitive coding tests
	-- {
	-- 	"xeluxee/competitest.nvim",
	-- 	cmd = "CompetiTest",
	-- 	keys = {
	-- 		{ "<leader>te", "<cmd>CompetiTest run<cr>", desc = "Execute testcase" },
	-- 		{ "<leader>ti", "<cmd>CompetiTest add_testcase<cr>", desc = "Add testcases" },
	-- 		{ "<leader>tt", "<cmd>CompetiTest edit_testcase<cr>", desc = "Edit testcase" },
	-- 	},
	-- 	opts = {},
	-- },

	-- Debug Adapter Protocol
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			{ "jay-babu/mason-nvim-dap.nvim", opts = { handlers = {} } },
		},
		keys = {
			{ "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Add breakpoint at line debugger" },
			{ "<leader>dr", "<cmd>DapContinue<cr>", desc = "Start or continue the debugger" },
			{ "<M-b>", "<cmd>DapToggleBreakpoint<cr>", desc = "Add breakpoint at line debugger" },
			{ "<M-r>", "<cmd>DapContinue<cr>", desc = "Start or continue the debugger" },
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
		end,
	},
}

require("dapui").setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
	},
  layouts = {
    {
      elements = {
			{
				id = "scopes",
				size = 0.4, -- Can be float or integer > 1
			},
			{ id = "watches", size = 0.4 },
			{ id = "stacks", size = 0.3 },
			-- { id = "breakpoints", size = 0.1 },
      },
      size = 50,
      position = 'left',
    },
    {
      elements = {
        'repl',
        'console',
      },
      size = 5,
      position = 'bottom',
    },
  },
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dap.repl.close()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dap.repl.close()
	dapui.close()
end

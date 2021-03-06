local dap = require("dap")
dap.adapters.cppdbg = {
	type = "executable",
	command = vim.fn.stdpath("data") .. "/dapinstall/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
}
dap.configurations.cpp = {
	{
		name = "C++ Launch",
		type = "cppdbg",
		request = "launch",
		program = "${workspaceFolder}/a.out",
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		MIMode = "gdb",
		miDebuggerPath = "/usr/bin/gdb",
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = true,
			},
		},
	},
}

dap.configurations.c = dap.configurations.cpp

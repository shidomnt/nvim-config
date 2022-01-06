require("dap")
vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

-- Extensions
require("user.dap.dapui")
require("user.dap.dap_install")
require("user.dap.dap_virtual_text")

-- Adapter List
require("user.dap.adapters.cppdbg")
require("user.dap.adapters.jsnode")

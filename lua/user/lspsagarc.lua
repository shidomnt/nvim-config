local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
  return
end

saga.setup {
}

vim.keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("v", "<leader>ca", "<cmd>Lspsaga range_code_action<CR>", { silent = true })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", { silent = true })
vim.keymap.set("n", "<space>rn", "<cmd>Lspsaga rename<CR>", { silent = true })
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
vim.keymap.set("n", "<space>e", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<space>e", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })


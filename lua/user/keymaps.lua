local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- Resize pane
keymap("n", "<M-Up>", ":resize -1<CR>", opts)
keymap("n", "<M-Down>", ":resize +1<CR>", opts)
keymap("n", "<M-Left>", ":vertical resize -1<CR>", opts)
keymap("n", "<M-Right>", ":vertical resize +1<CR>", opts)

-- Tab
keymap("n", "tt", ":tab split<CR>", opts)
keymap("n", "tw", ":tabclose<CR>", opts)
keymap("n", "tp", ":tabnext<CR>", opts)

-- Remove highlight
keymap("n", "<C-h>", ":nohl<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Nvim tree
keymap("n", "<F2>", ":NvimTreeToggle<CR>", opts)

-- Nvim DAP
keymap("n", "<Leader>ds", ":lua require'dap'.terminate()<CR>", opts)
keymap("n", "<Leader>dc", ":lua require'dap'.continue()<CR>", opts)
keymap("n", "<Leader>dt", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<Leader>de", ":lua require'dap'.step_out()<CR>", opts)
keymap("n", "<Leader>di", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<Leader>do", ":lua require'dap'.step_over()<CR>", opts)

-- Not auto close window when wipe a buffer
keymap("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)

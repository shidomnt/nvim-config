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
keymap("n", "<M-Up>", ":resize -2<CR>", opts)
keymap("n", "<M-Down>", ":resize +2<CR>", opts)
keymap("n", "<M-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-Right>", ":vertical resize +2<CR>", opts)

-- Tab
keymap("n", "tt", ":tab split<CR>", opts)
keymap("n", "tw", ":tabclose<CR>", opts)
keymap("n", "tp", ":tabnext<CR>", opts)

-- Complier C/C++
keymap("n", "<Leader>g++", ":!g++ %:t -g -o %:r<CR>", opts)

-- Remove highlight
keymap("n", "<C-h>", ":nohl<CR>", opts)

-- Telescope
keymap("n", "<leader>ff",":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Nvim tree
keymap("n", "<F2>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)

-- Vim spector
keymap("n", "<Leader>dl", ":call vimspector#Launch()<CR>", opts)
keymap("n", "<Leader>ds", ":call vimspector#Reset()<CR>", opts)
keymap("n", "<Leader>dc", ":call vimspector#Continue()<CR>", opts)
keymap("n", "<Leader>dt", ":call vimspector#ToggleBreakpoint()<CR>", opts)
keymap("n", "<Leader>dT", ":call vimspector#ClearBreakpoints()<CR>", opts)
keymap("n", "<Leader>de", ":call vimspector#StepOut()<CR>", opts)
keymap("n", "<Leader>di", ":call vimspector#StepInto()<CR>", opts)
keymap("n", "<Leader>do", ":call vimspector#StepOver()<CR>", opts)
keymap("n", "<Leader>dr", "<Plug>VimspectorRestart", opts)

-- Not auto close window when wipe a buffer
keymap("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)

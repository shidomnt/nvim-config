local options = {
  tabstop=2,
  expandtab = true,
  shiftwidth=2,
  shiftround = true,
  autowrite =true,
  autoindent = true,
  smartcase = true,
  fileencoding = "utf-8",
  smartindent = true,
  cindent = true,
  timeoutlen = 1000,
  undofile = true,
  writebackup = false,
  showmode = false,
  completeopt = { "menuone", "noselect" },
  clipboard = "unnamedplus",
  number= true,
  relativenumber= true,
  ignorecase= true,
  backup = false,
  swapfile = false,
  splitbelow= true,
  splitright= true,
  cursorline = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]

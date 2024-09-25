vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.wrap = true

-- I will not be caught off-guard by mixed spaces/tabs!!!
vim.opt.list = true

-- Windows skill issue
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
-- not sure exactly what this does tbh
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.winblend = 0

-- more mouse more problems
vim.opt.mouse = ""

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>oe", vim.cmd.Ex, { desc = "[O]pen N[e]twr" })

vim.keymap.set('n', "<leader>n", ":nohl<CR>", { desc = "[N]o Highlighting"})

-- keep cursor in center of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- thanks asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "[Y]ank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "[Y]ank-default to system clipboard "})

-- navigate quickfix list
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz", { desc = "Relative next quickfix"})
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz", { desc = "Relative previous quickfix"})

-- always be tweaking the config...
vim.keymap.set("n", "<leader>nec", "<cmd>e ~/.config/nvim<CR>", { desc = "[N]eovim [E]dit [C]onfig"});

-- splits 
vim.keymap.set('n', '<ca-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<ca-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<ca-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<ca-l>', '<C-w>l', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

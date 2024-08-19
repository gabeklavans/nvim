vim.g.mapleader = " "

vim.keymap.set("n", "<leader>oe", vim.cmd.Ex, { desc = "Open Netwr" })
vim.keymap.set('n', "<leader>n", ":nohl<CR>", { desc = "No Highlighting" })

-- keep cursor in center of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- navigate quickfix list
vim.keymap.set("n", "<CS-J>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<CS-K>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz", { desc = "Relative next quickfix" })
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz", { desc = "Relative previous quickfix" })

-- splits
vim.keymap.set('n', '<CA-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<CA-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<CA-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<CA-l>', '<C-w>l', { silent = true })

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>oe", vim.cmd.Ex, { desc = "Open Netwr" })

-- keep cursor in center of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- navigate quickfix list
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")

-- splits
vim.keymap.set('n', '<CA-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<CA-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<CA-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<CA-l>', '<C-w>l', { silent = true })

-- <C-^> is inconsistent and hard to reach
vim.keymap.set('n', '<C-t>', '<C-^>', { silent = true })

-- for copy-paste
local is_share_mode = false
local function toggle_share_mode()
    is_share_mode = not is_share_mode
    if is_share_mode then
        vim.opt.relativenumber = false
        vim.opt.number = false
        vim.opt.list = false
    else
        vim.opt.relativenumber = true
        vim.opt.number = true
        vim.opt.list = true
    end
end
vim.keymap.set('n', '<leader>sm', toggle_share_mode, { desc = "toggle share mode "})

-- for displaying screen to others
local is_display_mode = false
local function toggle_display_mode()
    is_display_mode = not is_display_mode
    if is_display_mode then
        vim.opt.relativenumber = false
        vim.opt.number = true
        vim.opt.list = false
    else
        vim.opt.relativenumber = true
        vim.opt.number = true
        vim.opt.list = true
    end
end
vim.keymap.set('n', '<leader>dm', toggle_display_mode, { desc = "toggle display mode "})

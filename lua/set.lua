vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.linebreak = true

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

-- handle tmux silly copy-pasteness
if vim.env.TMUX ~= nil then
    local copy = { 'tmux', 'load-buffer', '-w', '-' }
    local paste = { 'bash', '-c', 'tmux refresh-client -l && sleep 0.05 && tmux save-buffer -' }
    vim.g.clipboard = {
        name = 'tmux',
        copy = {
            ['+'] = copy,
            ['*'] = copy,
        },
        paste = {
            ['+'] = paste,
            ['*'] = paste,
        },
        cache_enabled = 0,
    }
end

-- customize auto-complete behavior
vim.cmd([[set completeopt+=fuzzy,menuone,noinsert,popup,preview]])

-- yoinked from Abstract-IDE/abstract-autocmds
vim.api.nvim_create_autocmd("BufWinEnter", {
    desc = "jump to the last position when reopening a file",
    pattern = "*",
    command = [[ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]],
})

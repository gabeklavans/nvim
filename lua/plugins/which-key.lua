return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        spec = {
            { '<leader>c', desc = 'Code' },
            { '<leader>g', desc = 'Git' },
            { '<leader>h', desc = 'Gitsigns/Hunk' },
            { '<leader>r', desc = 'Rename' },
            { '<leader>s', desc = 'Search' },
            { '<leader>t', desc = 'Toggle' },
            { '<leader>q', desc = 'Quick views' },
        }
    },
}

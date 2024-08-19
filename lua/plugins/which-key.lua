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
            { '<leader>r', desc = 'Rename' },
            { '<leader>s', desc = 'Search' },
            { '<leader>q', desc = 'Quick views' },
        }
    },
}

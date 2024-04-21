return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {},
    config = function()
        require('which-key').register {
            ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
            -- ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
            ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
            ['<leader>h'] = { name = 'Gitsigns/[H]unk', _ = 'which_key_ignore' },
            -- ['<leader>a'] = { name = 'H[a]rpoon', _ = 'which_key_ignore' },
            ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
            ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
            ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
            -- ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
        }
    end
}

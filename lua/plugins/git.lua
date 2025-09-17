return {
    "tpope/vim-fugitive",
    config = function ()
        vim.keymap.set('n', '<leader>g', ':G<cr>', { desc = 'Open Fugitive' } )
        vim.keymap.set('n', '<leader>b', ':G blame<cr>', { desc = 'Open Git blame' } )
    end
}

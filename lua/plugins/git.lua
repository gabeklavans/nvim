return {
    "tpope/vim-fugitive",
    config = function ()
        vim.keymap.set('n', '<leader>gg', ':G<cr>', { desc = 'Open Fugitive' } )
    end
}

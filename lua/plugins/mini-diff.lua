return {
    'echasnovski/mini.diff',
    version = false,
    opts = {},
    init = function()
        vim.keymap.set("n", "\\o", function() require('mini.diff').toggle_overlay() end, { desc = 'Toggle diff overlay' })
    end
}

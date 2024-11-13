return {
    'MeanderingProgrammer/render-markdown.nvim',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    init = function()
        local render_md = require('render-markdown')
        vim.keymap.set('n', '\\M', render_md.toggle, { desc = 'Toggle markdown render' })
    end,
}

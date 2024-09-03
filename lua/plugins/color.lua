return
-- {
--     'Mofiqul/dracula.nvim',
--     priority = 1000,
--     config = function()
--         vim.cmd.colorscheme 'dracula'
--     end,
-- }
-- {
--     'Mofiqul/vscode.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require('vscode').setup {
--             transparent = false,
--         }
--         vim.cmd.colorscheme "vscode"
--     end,
-- }
-- {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("tokyonight").setup {
--             style = "night"
--         };
--         vim.cmd [[colorscheme tokyonight]]
--     end
-- }
{
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup {
            flavour = "auto",
        }

        vim.cmd.colorscheme "catppuccin"
    end
}

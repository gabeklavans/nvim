return {
    'echasnovski/mini.files',
    version = '*',
    config = function()
        local mini_files = require("mini.files")
        mini_files.setup {
            options = {
                use_as_default_explorer = false,
            },
        }

        vim.keymap.set("n", "<leader>oe", mini_files.open, { desc = "open mini.files" })
    end
}

return {
    'echasnovski/mini.pick',
    version = '*',
    config = function()
        require('mini.pick').setup {
            options = {
                use_cache = true,
            }
        }

        local function search_git_files()
            MiniPick.builtin.files({ tool = "git" })
        end

        local function search_word()
            MiniPick.builtin.grep({ vim.fn.expand("<cword>") })
        end

        -- vim.keymap.set("n", "<leader>sb", builtin.builtin, { desc = "search builtins" })
        vim.keymap.set("n", "<leader>sg", search_git_files, { desc = "search git" })
        vim.keymap.set("n", "<leader>sf", MiniPick.builtin.files, { desc = "search files" })
        vim.keymap.set("n", "<leader>sh", MiniPick.builtin.help, { desc = "search help" })
        vim.keymap.set("n", "<leader>sw", search_word, { desc = "search current word" })
        vim.keymap.set("n", "<leader>si", MiniPick.builtin.grep_live, { desc = "search in files" })
        vim.keymap.set("n", "<leader>sr", MiniPick.builtin.resume, { desc = "search resume" })
    end
}

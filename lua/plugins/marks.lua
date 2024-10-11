return {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = function()
        require("marks").setup {
            default_mappings = true,
        }

        vim.keymap.set("n", "<leader>qm", "<cmd>MarksQFListAll<CR>", { desc = "Send all marks to qf" })
        vim.keymap.set("n", "\\m", "<cmd>MarksToggleSigns<CR>", { desc = "Toggle mark signs" })
    end
}

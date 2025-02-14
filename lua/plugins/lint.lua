return {
    "mfussenegger/nvim-lint",
    event = {
        "BufWritePost",
    },
    keys = {
        "<leader>t",
    },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            python = { "pylint" },
        }

        vim.keymap.set("n", "<leader>t", function()
            lint.try_lint()
        end, { desc = "lint file" })

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                lint.try_lint()
            end
        })
    end,
}

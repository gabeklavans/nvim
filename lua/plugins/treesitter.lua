return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "cmake",
                "comment",
                "dockerfile",
                "go",
                "javascript",
                "lua",
                "python",
                "vimdoc",
            },
            sync_install = false,
            highlight = {
                enable = true,
                disable = function(lang, bufnr)
                    return vim.api.nvim_buf_line_count(bufnr) > 5000
                end
            },
            indent = { enable = true },
        })
    end
}

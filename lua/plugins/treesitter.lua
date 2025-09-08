return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            auto_install = false,
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
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}

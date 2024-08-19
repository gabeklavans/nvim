return {
    "Abstract-IDE/abstract-autocmds",
    lazy = false,
    config = function()
        require("abstract-autocmds").setup({
            no_autocomment_newline = true,
            open_file_last_position = true,
            highlight_on_yank = false,
            give_border = {
                enable = true,
                opts = {
                    pattern = { "null-ls-info", "lspinfo" },
                },
            },
            move_selected_upndown = true,
            go_back_normal_in_terminal = true,
            dont_suspend_with_cz = true,
        })
    end,
}

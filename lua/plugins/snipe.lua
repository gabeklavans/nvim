return {
    "leath-dub/snipe.nvim",
    keys = {
        { "g/", function() require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu" }
    },
    opts = {
        ui = {
            position = "center",
        },
        hints = {
            dictionary = "abcdefgimnop"
        },
    }
}

return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    -- No make on Windows... by deafult
    -- build = "make install_jsregexp",
    config = function()
        local ls = require("luasnip")
        require('luasnip.loaders.from_vscode').lazy_load()
        ls.filetype_extend("javascript", { "jsdoc" })

        --- TODO: What is expand?
        vim.keymap.set({"i"}, "<C-s>e", function() ls.expand() end, {silent = true})

        vim.keymap.set({"i", "s"}, "<C-s>;", function() ls.jump(1) end, {silent = true})
        vim.keymap.set({"i", "s"}, "<C-s>,", function() ls.jump(-1) end, {silent = true})

        vim.keymap.set({"i", "s"}, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, {silent = true})
    end,

}

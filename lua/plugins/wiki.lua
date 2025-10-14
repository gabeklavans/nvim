return {
    "lervag/wiki.vim",
    lazy = false,
    init = function()
        vim.g.wiki_root = '~/Documents/notes/'
        vim.g.wiki_journal = {
            name = "journal",
            date_format = {
                daily = "%Y/%m/%d",
                weekly = "%Y/%m/week-%U",
                monthly = "%Y/%m/summary"
            }
        }

        -- don't treat any md file as a wiki
        vim.g.wiki_global_load = false

        -- TODO: make selectors for mini.pick :3
        -- vim.g.wiki_select_method = {
        --     pages = require("wiki.telescope").pages,
        --     tags = require("wiki.telescope").tags,
        --     toc = require("wiki.telescope").toc,
        --     links = require("wiki.telescope").links,
        -- }

        vim.g.wiki_tag_scan_num_lines = "all"

        vim.cmd [[
            let g:wiki_link_creation = {
                  \ 'md': {
                  \   'link_type': 'wiki',
                  \   'url_extension': '',
                  \   'url_transform': { x ->
                  \     wiki#url#utils#url_encode_specific(x, '()') },
                  \   'link_text': { url -> wiki#toc#get_page_title(url) },
                  \ },
                  \ 'org': {
                  \   'link_type': 'org',
                  \   'url_extension': '.org',
                  \ },
                  \ 'adoc': {
                  \   'link_type': 'adoc_xref_bracket',
                  \   'url_extension': '',
                  \ },
                  \ '_': {
                  \   'link_type': 'wiki',
                  \   'url_extension': '',
                  \ },
                  \}
        ]]
    end,
    config = function()
        -- has to be set here otherwise default_parser isn't loaded yet
        vim.cmd [[
            let s:tag_parser = deepcopy(g:wiki#tags#default_parser)
            let s:tag_parser.re_match = '\v%(^|\s)#\zs[^# ]+'
            let s:tag_parser.re_findstart = '\v%(^|\s)#\zs[^# ]+'
            let s:tag_parser.re_parse = '\v#\zs[^# ]+'
            let s:tag_parser.make = {t, l -> empty(t) ? '' : join(map(t, '"#" . v:val'))}

            let g:wiki_tag_parsers = [s:tag_parser]
        ]]
        -- Just try to convert that to lua. I dare you.

        vim.keymap.set("n", "[j", ":WikiJournalPrev<cr>")
        vim.keymap.set("n", "]j", ":WikiJournalNext<cr>")
        vim.keymap.set("n", "<leader>wj", ":WikiJournal<cr>")
        vim.keymap.set("n", "<leader>ww", ":WikiJournal<cr>:WikiJournalToWeek<cr>")
        vim.keymap.set("n", "<leader>wm", ":WikiJournal<cr>:WikiJournalToMonth<cr>")
        vim.keymap.set("n", "<leader>wsp", ":WikiPages<cr>")
        vim.keymap.set("n", "<leader>wst", ":WikiTags<cr>")
        vim.keymap.set("n", "<leader>wla", ":WikiLinkAdd<cr>")
    end
}

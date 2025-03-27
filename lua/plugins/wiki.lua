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
    end
}

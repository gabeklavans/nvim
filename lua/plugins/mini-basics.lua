return {
    'echasnovski/mini.basics',
    version = false,
    opts = {
        options = {
            basic = false,
            extra_ui = true,
            win_borders = 'double'
        },
        mappings = {
            -- Basic mappings (better 'jk', save with Ctrl+S, ...)
            basic = true,
            -- Prefix for mappings that toggle common options ('wrap', 'spell', ...).
            option_toggle_prefix = [[\]],
            windows = false,
            move_with_alt = false,
        },
        autocommands = {
            -- Basic autocommands (highlight on yank, start Insert in terminal, ...)
            basic = true,
            relnum_in_visual_mode = false,
        },
        silent = false,
    }
}

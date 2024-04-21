local function codestats()
    return "C::S ".. require('codestats-nvim').get_xp_count()
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            icons_enabled = true,
            theme = 'auto',
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = {
                {
                    'filename',
                    file_status = true,
                    newfile_status = true,
                    path = 1,
                },
            },
            lualine_x = {
                'fileformat',
                {
                    'filetype',
                    icon_only = true,
                },
                codestats },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
    },

}

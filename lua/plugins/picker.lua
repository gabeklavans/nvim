return {
    'echasnovski/mini.pick',
    version = '*',
    config = function()
        require('mini.pick').setup {
            options = {
                use_cache = true,
            }
        }

        local function search_git_files()
            MiniPick.builtin.files({ tool = "git" })
        end

        local function search_word()
            MiniPick.builtin.grep({ vim.fn.expand("<cword>") })
        end

        -- context: https://github.com/echasnovski/mini.nvim/issues/1859#issuecomment-2979332899
        -- config source: https://github.com/echasnovski/mini.nvim/issues/1291#issuecomment-2423757112
        local load_temp_rg_config = function(f)
            local rg_env = 'RIPGREP_CONFIG_PATH'
            local cached_rg_config = vim.uv.os_getenv(rg_env) or ''
            vim.uv.os_setenv(rg_env, vim.fn.stdpath('config') .. '/.rg')
            f()
            vim.uv.os_setenv(rg_env, cached_rg_config)
        end

        MiniPick.registry.grep_live_with_config = function()
            load_temp_rg_config(function()
                MiniPick.builtin.grep_live({ tool = 'rg' })
            end)
        end

        -- vim.keymap.set("n", "<leader>sb", builtin.builtin, { desc = "search builtins" })
        vim.keymap.set("n", "<leader>sg", search_git_files, { desc = "search git" })
        vim.keymap.set("n", "<leader>sf", MiniPick.builtin.files, { desc = "search files" })
        vim.keymap.set("n", "<leader>sh", MiniPick.builtin.help, { desc = "search help" })
        vim.keymap.set("n", "<leader>sw", search_word, { desc = "search current word" })
        vim.keymap.set("n", "<leader>si", MiniPick.registry.grep_live_with_config, { desc = "search in files" })
        vim.keymap.set("n", "<leader>sr", MiniPick.builtin.resume, { desc = "search resume" })
    end
}

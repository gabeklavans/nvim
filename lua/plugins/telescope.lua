return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "fdschmidt93/telescope-egrepify.nvim"
    },
    config = function()
        local telescope = require "telescope"
        -- this has to go in here instead of in `opts` for some reason
        telescope.setup {
            pickers = {
                live_grep = {
                    additional_args = function(opts)
                        return { "--hidden" }
                    end
                },
            },
            extensions = {
                egrepify = {
                    prefixes = {
                        ["@"] = {
                            flag = "type",
                            cb = function(input)
                                return input
                            end,
                        },
                    },
                },
            },
        }
        telescope.load_extension "egrepify"

        local builtin = require("telescope.builtin")

        local function telescope_live_grep_open_files()
            builtin.live_grep {
                grep_open_files = true,
                prompt_title = 'Live Grep in Open Files',
            }
        end

        vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
        vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
        vim.keymap.set("n", "<leader>sg", builtin.git_files, { desc = "[S]earch [G]it" })
        vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
        vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
        vim.keymap.set("n", "<leader>si", telescope.extensions.egrepify.egrepify, { desc = "[S]earch [i]n Files" })
        vim.keymap.set("n", "<leader>sG", ":LiveGrepGitRoot<cr>", { desc = "[S]earch by [G]rep on Git Root" })
        vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
        vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
    end,
}

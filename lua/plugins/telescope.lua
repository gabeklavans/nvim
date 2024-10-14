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

        local function telescope_get_lsp_functions()
            builtin.lsp_document_symbols({
                symbols = "function",
                prompt_title = "Search LSP Document Functions",
            })
        end

        local function telescope_get_lsp_methods()
            builtin.lsp_document_symbols({
                symbols = "method",
                prompt_title = "Search LSP Document Methods",
            })
        end

        local function get_ts_functions()
            builtin.treesitter({
                symbols = "function", -- this isn't implemented in 0.1.8 for some reason
                prompt_title = "Search TS Functions",
            })
        end

        vim.keymap.set("n", "<leader>s/", telescope_live_grep_open_files, { desc = "search / in open files" })
        vim.keymap.set("n", "<leader>sb", builtin.builtin, { desc = "search builtins" })
        vim.keymap.set("n", "<leader>sg", builtin.git_files, { desc = "search git" })
        vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "search files" })
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "search help" })
        vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "search current word" })
        vim.keymap.set("n", "<leader>si", telescope.extensions.egrepify.egrepify, { desc = "search in files" })
        vim.keymap.set("n", "<leader>sG", ":LiveGrepGitRoot<cr>", { desc = "search by grep on git root" })
        vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "search diagnostics" })
        vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "search resume" })
        vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "search document symbols" })
        vim.keymap.set("n", "<leader>st", builtin.treesitter, { desc = "search ts nodes" })
        vim.keymap.set("n", "<leader>sf", get_ts_functions, { desc = "search ts functions" })
    end,
}

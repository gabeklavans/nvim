return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        local lsp_zero = require("lsp-zero")
        local ts_builtin = require("telescope.builtin")

        lsp_zero.on_attach(function(_, bufnr)
            lsp_zero.default_keymaps({
                buffer = bufnr,
                preserve_mappings = false,
            })

            local nmap = function(keys, func, desc)
                if desc then
                    desc = "LSP: " .. desc
                end

                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
            end
            nmap('<leader>ds', ts_builtin.lsp_document_symbols, 'Document Symbols')
            nmap('<leader>ws', ts_builtin.lsp_dynamic_workspace_symbols, 'Workspace Symbols')
        end)

        local capabilities = require("blink.cmp").get_lsp_capabilities()

        require("mason").setup({})
        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls",
            },
        }
        require("mason-lspconfig").setup_handlers {
            -- default handler
            function(server_name)
                require("lspconfig")[server_name].setup {
                    capabilities = capabilities,
                }
            end,

            -- handler overrides
            ["lua_ls"] = function()
                local lspconfig = require("lspconfig")
                lspconfig.lua_ls.setup {
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim", "it", "describe", "before_each", "after_each" },
                            }
                        }
                    }
                }
            end,

            clangd = function()
                local lspconfig = require("lspconfig")
                lspconfig.clangd.setup {
                    capabilities = capabilities,
                    cmd = {
                        "clangd",
                        "--header-insertion=never"
                    }
                }
                local nmap = function(keys, func, desc)
                    desc = "clangd: " .. desc

                    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
                end
                nmap('<c-s>', '<CMD>ClangdSwitchSourceHeader<CR>', 'alternate source/header')
            end,

            ["ts_ls"] = function()
                local lspconfig = require("lspconfig")
                lspconfig.ts_ls.setup {
                    single_file_support = false,
                    root_dir = require('lspconfig.util').root_pattern('package.json', 'jsconfig.json')
                }
            end,

            denols = function()
                local lspconfig = require("lspconfig")
                lspconfig.denols.setup {
                    single_file_support = false,
                    root_dir = require('lspconfig.util').root_pattern('deno.json', 'deno.jsonc')
                }
            end
        }
    end
}

return {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/nvim-cmp",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local lsp_zero = require("lsp-zero")
        local ts_builtin = require("telescope.builtin")

        lsp_zero.on_attach(function(client, bufnr)
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
            nmap("<leader>rn", vim.lsp.buf.rename, "Rename")
            nmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
            nmap('gd', ts_builtin.lsp_definitions, 'Goto Definition')
            nmap('gr', ts_builtin.lsp_references, 'Goto References')
            nmap('gI', ts_builtin.lsp_implementations, 'Goto Implementation')
            nmap('<leader>D', ts_builtin.lsp_type_definitions, 'Type Definition')
            nmap('<leader>ds', ts_builtin.lsp_document_symbols, 'Document Symbols')
            nmap('<leader>ws', ts_builtin.lsp_dynamic_workspace_symbols, 'Workspace Symbols')
        end)

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

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

            },
        })

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require("cmp")
        local cmp_action = require("lsp-zero").cmp_action()

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp_action.luasnip_supertab(),
                ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
            }),
            preselect = "item",
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "luasnip" },
                { name = "path" },
            },
        })

        cmp.event:on(
            "confirm_done",
            cmp_autopairs.on_confirm_done()
        )
    end
}

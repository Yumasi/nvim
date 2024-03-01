local function lua_ls_setup(lspconfig, capabilities)
    -- Lua language server
    lspconfig.lua_ls.setup {
        capabilities = capabilities,
        on_init = function(client)
            local path = client.workspace_folders[1].name
            if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT'
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                                -- "${3rd}/luv/library"
                                -- "${3rd}/busted/library",
                            }
                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                            -- library = vim.api.nvim_get_runtime_file("", true)
                        }
                    }
                })

                client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
            end
            return true
        end
    }
end

return {
    {
        "neovim/nvim-lspconfig",

        event = { "BufEnter", "BufRead" },
        config = function()
            local lspconfig = require('lspconfig')
            -- Add additional capabilities supported by nvim-cmp
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local servers = {
                'clangd',
                'gopls',
                'ruff_lsp',
            }
            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                    capabilities = capabilities,
                }
            end
            lua_ls_setup(lspconfig, capabilities)


            -- Setup format on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = buffer,
                callback = function()
                    vim.lsp.buf.format { async = false }
                end
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Goto definition", buffer = ev.buf })
                    vim.keymap.set('n', 'gD', vim.lsp.buf.references, { desc = "Goto references", buffer = ev.buf })
                end,
            })

            -- Set up nlsp-settings
            require('nlspsettings').setup({
                config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
                local_settings_dir = ".nlsp-settings",
                local_settings_root_markers_fallback = { '.git' },
                append_default_schemas = true,
                loader = 'json'
            })
        end,

        dependencies = {
            { "williamboman/mason.nvim", config = true },
            {
                "williamboman/mason-lspconfig.nvim",
                opts = {
                    ensure_installed = {
                        'lua_ls',
                        'ruff_lsp',
                    },
                },
            },
            'tamago324/nlsp-settings.nvim',
        },
    },

    {
        'hrsh7th/nvim-cmp',

        event = "BufEnter",
        config = function()
            local cmp = require('cmp')
            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                sources = cmp.config.sources({
                    { name = 'copilot' },
                    { name = 'path' },
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'luasnip' },
                }, {
                    { name = 'buffer' },
                }),

                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
                    ['<CR>'] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
            })
        end,

        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
    },

}

return {
    {
        'bluz71/vim-nightfly-colors',
        name = 'nightfly',
        lazy = false,
        priority = 1000,
        config = function(_, _)
            vim.cmd('colorscheme nightfly')
            vim.g.nightflyCursorColor = true
        end,
    },
    -- better vim.ui
    {
        "stevearc/dressing.nvim",
        lazy = true,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = function()
            -- PERF: we don't need this lualine require madness 🤷
            local lualine_require = require("lualine_require")
            lualine_require.require = require

            vim.o.laststatus = vim.g.lualine_laststatus

            return {
                options = {
                    theme = "auto",
                    globalstatus = true,
                    disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },

                    lualine_c = {
                        { "diagnostics" },
                        { "filetype",   icon_only = true,   separator = "", padding = { left = 1, right = 0 } },
                        { "filename",   file_status = true, path = 1 },
                    },
                    lualine_x = {
                        {
                            function() return "  " .. require("dap").status() end,
                            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
                        },
                        {
                            require("lazy.status").updates,
                            cond = require("lazy.status").has_updates,
                        },
                        {
                            "diff",
                            source = function()
                                local gitsigns = vim.b.gitsigns_status_dict
                                if gitsigns then
                                    return {
                                        added = gitsigns.added,
                                        modified = gitsigns.changed,
                                        removed = gitsigns.removed,
                                    }
                                end
                            end,
                        },
                    },
                    lualine_y = {
                        { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
                        { "location", padding = { left = 0, right = 1 } },
                    },
                    lualine_z = {
                        function()
                            return " " .. os.date("%R")
                        end,
                    },
                },
                extensions = { "neo-tree", "lazy" },
            }
        end,
    },
    "HiPhish/rainbow-delimiters.nvim",
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = "hyper",
            }
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    }
}

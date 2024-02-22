return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local opts = {
                pickers = {
                    fd = {
                        theme = "ivy",
                    },
                    live_grep = {
                        theme = "ivy",
                    },
                    buffers = {
                        theme = "ivy",
                    },
                    git_files = {
                        theme = "ivy",
                    },
                },
            }

            require('telescope').setup(opts)
        end,
        cmd = "Telescope",
        keys = function()
            local builtin = require('telescope.builtin')
            return {
                { '<leader>pf', builtin.fd,        { desc = "Files" } },
                { '<leader>ps', builtin.live_grep, { desc = "Search" } },
                { '<leader>bb', builtin.buffers,   { desc = "Find buffer" } },
                { '<leader>hm', builtin.man_pages, { desc = "Man pages" } },
                { '<leader>hh', builtin.help_tags, { desc = "Help pages" } },
                { '<C-p>',      builtin.git_files, { desc = "Browse Git files" } },
            }
        end,
    },
}

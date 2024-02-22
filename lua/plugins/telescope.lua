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
        keys = {
            { '<leader>pf', ":Telescope fd<CR>",        { desc = "Files" } },
            { '<leader>ps', ":Telescope live_grep<CR>", { desc = "Search" } },
            { '<leader>bb', ":Telescope buffers<CR>",   { desc = "Find buffer" } },
            { '<leader>hm', ":Telescope man_pages<CR>", { desc = "Man pages" } },
            { '<leader>hh', ":Telescope help_tags<CR>", { desc = "Help pages" } },
            { '<C-p>',      ":Telescope git_files<CR>", { desc = "Browse Git files" } },
        },
    },
}

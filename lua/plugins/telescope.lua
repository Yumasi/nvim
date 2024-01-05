return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
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
        },
    },
}

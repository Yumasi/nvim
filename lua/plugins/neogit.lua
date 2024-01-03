return {
    {
        'NeogitOrg/neogit',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'sindrets/diffview.nvim',
        },
        config = true,
        cmd = "Neogit",
        keys = {
            { '<leader>gs', vim.cmd.Neogit, desc = "Git status" },
        }
    },
}

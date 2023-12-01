return {
    {
        'NeogitOrg/neogit',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'sindrets/diffview.nvim',
            'ibhagwan/fzf-lua',
        },
        config = true,
        cmd = "Neogit",
        keys = {
            { '<leader>gs', vim.cmd.Neogit, desc = "Git status" },
        }
    },
}

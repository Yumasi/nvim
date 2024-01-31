return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/nvim-cmp' },
            { 'L3MON4D3/LuaSnip' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        keys = {
            { 'gd', vim.lsp.buf.definition, desc = "Goto definition" },
            { 'gD', vim.lsp.buf.references, desc = "Goto references" },
        },
    },
}

return {
    "folke/zen-mode.nvim",
    opts = {
        plugins = {
            kitty = {
                enabled = true,
            },
        },
    },
    keys = {
        { "<leader>tz", vim.cmd.ZenMode, desc = "Toggle zen mode" },
    },
}

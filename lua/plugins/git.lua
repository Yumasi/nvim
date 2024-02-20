return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufEnter",
        config = function()
            require("gitsigns").setup()
        end,
        keys = {
            { "<leader>gs", ":Gitsigns stage_hunk<CR>",                desc = "Stage hunk",  mode = { "n", "v" } },
            { "<leader>gu", ":Gitsigns reset_hunk<CR>",                desc = "Undo hunk",   mode = { "n", "v" } },
            { "<leader>gS", ":Gitsigns stage_buffer<CR>",              desc = "Stage buffer" },
            { "<leader>gh", ":Gitsigns preview_hunk<CR>",              desc = "Preview hunk" },
            { "<leader>gr", ":Gitsigns reset_buffer<CR>",              desc = "Undo buffer" },
            { "<leader>gb", ":Gitsigns blame_line<CR>",                desc = "Blame line" },
            { "<leader>gB", ":Gitsigns toggle_current_line_blame<CR>", desc = "Toggle blame" },
        },
    },
    }
}

return {
    {
        'theprimeagen/harpoon',
        init = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon file" })
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon quick menu" })

            vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "Show mark 1" })
            vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "Show mark 2" })
            vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "Show mark 3" })
            vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "Show mark 4" })
        end,
    },
}

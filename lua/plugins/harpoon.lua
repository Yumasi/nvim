return {
    {
        'theprimeagen/harpoon',
        keys = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            return {
                { "<leader>a", mark.add_file,                 desc = "Harpoon file" },
                { "<C-e>",     ui.toggle_quick_menu,          desc = "Harpoon quick menu" },

                { "<leader>1", function() ui.nav_file(1) end, desc = "Show mark 1" },
                { "<leader>2", function() ui.nav_file(2) end, desc = "Show mark 2" },
                { "<leader>3", function() ui.nav_file(3) end, desc = "Show mark 3" },
                { "<leader>4", function() ui.nav_file(4) end, desc = "Show mark 4" },
            }
        end,
    },
}

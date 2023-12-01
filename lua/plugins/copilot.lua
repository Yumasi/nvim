return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = true,
        dependencies = {
            {
                "zbirenbaum/copilot-cmp",
                config = true,
            },
        },
    },
}

local wk = require("which-key")

wk.register({
    b = { name = "buffers" },
    f = { name = "file" },
    g = { name = "git" },
    h = { name = "help" },
    p = { name = "project" },
    w = { name = "window" },
}, { prefix = "<leader>" })

vim.keymap.set("n", "<leader>fd", vim.cmd.Ex, { desc = "Browse current directory" })
vim.keymap.set("n", "<leader>fs", vim.cmd.write, { desc = "Save file" })
vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete, { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>w", "<C-w>", { noremap = false })
vim.keymap.set("i", "jk", "<ESC>", { noremap = false })

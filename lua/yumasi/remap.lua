local wk = require("which-key")

vim.g.mapleader = " "

wk.register({
    f = {
      name = "file",
    },
    p = {
      name = "project",
    },
    b = {
      name = "buffers",
    },
    h = {
      name = "help",
    },
  }, { prefix = "<leader>" })

vim.keymap.set("n", "<leader>fd", vim.cmd.Ex, { desc = "Browse current directory" })
vim.keymap.set("n", "<leader>fs", vim.cmd.write, { desc = "Save file" })

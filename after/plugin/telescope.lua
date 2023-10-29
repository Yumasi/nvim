local builtin = require('telescope.builtin')

vim.g.mapleader = " "
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Files" })
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = "Search" })
vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = "Find buffer" })
vim.keymap.set('n', '<leader>hm', builtin.man_pages, { desc = "Man pages" })
vim.keymap.set('n', '<C-p>',      builtin.git_files, { desc = "Browse Git files" })

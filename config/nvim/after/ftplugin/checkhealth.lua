local opts = { buffer = true, silent = true, nowait = true }

vim.keymap.set("n", "d", "<C-d>", opts)
vim.keymap.set("n", "u", "<C-u>", opts)

vim.keymap.set('n', 'e', '<C-e>', opts)
vim.keymap.set('n', 'y', '<C-y>', opts)

vim.keymap.set('n', 'f', '<C-f>', opts)
vim.keymap.set('n', 'b', '<C-b>', opts)
vim.keymap.set('n', '<Space>', '<C-f>', opts)

vim.keymap.set('n', 'q', ':nohlsearch<CR>:q<CR>', opts)

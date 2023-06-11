local telescope = require('telescope')

vim.keymap.set('n', '<leader>m', "<Cmd>lua require('harpoon.mark').add_file()<CR>")
vim.keymap.set('n', '[g', "<Cmd>lua require('harpoon.ui').nav_next()<CR>")
vim.keymap.set('n', ']g', "<Cmd>lua require('harpoon.ui').nav_prev()<CR>")
vim.keymap.set('n', '<leader><leader>', '<Cmd>Telescope harpoon marks<CR>')

telescope.load_extension('harpoon')

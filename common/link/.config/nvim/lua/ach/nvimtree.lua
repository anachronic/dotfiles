local util = require('ach.util')

require 'nvim-tree'.setup {
    git = {
        enable = false
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false
            }
        }
    }
}

vim.keymap.set('n', '<A-1>', '<cmd>NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>j', '<cmd>NvimTreeFindFile<CR>')

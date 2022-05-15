local util = require('ach.util')
local map = util.map

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

map('n', '<A-1>', '<cmd>NvimTreeToggle<CR>')
map('n', '<leader>j', '<cmd>NvimTreeFindFile<CR>')


local util = require('ach.util')
local map = util.map

vim.g.nvim_tree_show_icons = {
    git = 0,
    files = 1,
    folders = 1,
    folder_arrows = 1
}
vim.g.nvim_tree_disable_window_picker = 1

require 'nvim-tree'.setup {
}

map('n', '<A-1>', '<cmd>NvimTreeToggle<CR>')
map('n', '<leader>j', '<cmd>NvimTreeFindFile<CR>')


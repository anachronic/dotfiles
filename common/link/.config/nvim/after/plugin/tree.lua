local util = require('ach.util')
local map = util.map

vim.g.nvim_tree_disable_window_picker = 1

map('n', '<A-1>', '<cmd>NvimTreeToggle<CR>')
map('n', '<leader>j', '<cmd>NvimTreeFindFile<CR>')

require('nvim-tree').setup({
    git = {
        enable = false,
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
    filters = {
        custom = {
            '__pycache__',
        },
    },
})

require('oil').setup()


vim.keymap.set('n', '<A-1>', '<cmd>NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>f', '<cmd>NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>j', '<cmd>NvimTreeFindFile<CR>')
vim.keymap.set('n', '-', '<cmd>Oil<CR>')

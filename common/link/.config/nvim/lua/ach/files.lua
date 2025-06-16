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

require('oil').setup({
    use_default_keymaps = false,
    keymaps = {
        ['g?'] = { 'actions.show_help', mode = 'n' },
        ['<CR>'] = 'actions.select',
        ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
        ['<C-t>'] = { 'actions.select', opts = { tab = true } },
        ['<C-c>'] = { 'actions.close', mode = 'n' },
        ['gr'] = 'actions.refresh',
        ['-'] = { 'actions.parent', mode = 'n' },
        ['_'] = { 'actions.open_cwd', mode = 'n' },
        ['`'] = { 'actions.cd', mode = 'n' },
        ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
        ['gs'] = { 'actions.change_sort', mode = 'n' },
        ['gx'] = 'actions.open_external',
        ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
        ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
    },
})

vim.keymap.set('n', '<A-1>', '<cmd>NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>f', '<cmd>NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>j', '<cmd>NvimTreeFindFile<CR>')
vim.keymap.set('n', '-', '<cmd>Oil<CR>')

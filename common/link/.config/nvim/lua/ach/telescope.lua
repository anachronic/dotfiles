local telescope = require('telescope')
local builtins = require('telescope.builtin')
local actions = require('telescope.actions')

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<C-u>'] = false,
            },
        },
    },
})

vim.keymap.set('n', '<leader>h', builtins.help_tags)
vim.keymap.set('n', '<C-p>', builtins.find_files)
vim.keymap.set('n', '<leader>b', builtins.buffers)
vim.keymap.set('n', '<leader>a', builtins.live_grep)

local util = require('ach.util')

require('zen-mode').setup {
    window = {
        options = {
            signcolumn = 'no',
            number = false
        }
    },
    plugins = {
        options = {
            enabled = true
        },
        tmux = { enabled = false },
        gitsigns = { enabled = false }
    }
}

util.map('n', '<leader>z', ':ZenMode<CR>')

local util = require('ach.util')

require'neogit'.setup {
    disable_commit_confirmation = true,
}

util.map('n', '<leader>gg', '<cmd>Neogit<CR>')

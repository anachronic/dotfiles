require('zen-mode').setup({
    window = {
        options = {
            signcolumn = 'no',
            number = false,
        },
    },
    plugins = {
        options = {
            enabled = true,
        },
        tmux = { enabled = false },
        gitsigns = { enabled = false },
    },
})

vim.keymap.set('n', '<leader>z', ':ZenMode<CR>')

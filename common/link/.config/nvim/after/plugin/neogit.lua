require('neogit').setup({
    disable_commit_confirmation = true,
    integrations = {
        diffview = true,
    },
})

vim.keymap.set('n', '<leader>gg', '<cmd>lua require("neogit").open()<CR>')

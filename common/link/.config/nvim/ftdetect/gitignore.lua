vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = '.gitignore',
    command = 'set filetype=gitignore',
})

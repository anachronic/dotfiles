vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = '*.rasi',
    command = 'set filetype=css',
})

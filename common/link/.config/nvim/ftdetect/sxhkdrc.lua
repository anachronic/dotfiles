vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = 'sxhkdrc',
    command = 'set filetype=sxhkdrc',
})

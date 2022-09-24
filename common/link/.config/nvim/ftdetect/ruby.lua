vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = '*.jbuilder',
    command = 'set filetype=ruby',
})

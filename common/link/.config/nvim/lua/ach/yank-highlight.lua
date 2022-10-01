local ach_augroup = vim.api.nvim_create_augroup('AnachronicAutocmds', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    command = 'silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=120}',
    group = ach_augroup,
})

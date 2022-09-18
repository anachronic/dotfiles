local fzf = require('fzf-lua')
local actions = require('fzf-lua.actions')

-- Will be set by zshenv so it's safe
local default_skim_cmd = vim.fn.getenv('SKIM_DEFAULT_COMMAND')

require('fzf-lua').setup({
    fzf_bin = 'sk', -- use skim instead of fzf
    fzf_layout = 'list',
    files = {
        previewer = false,
    },
    buffers = {
        previewer = false,
    },
    grep = {
        previewer = false,
    },
})

vim.keymap.set('n', '<leader>h', fzf.help_tags)
vim.keymap.set('n', '<C-p>', fzf.files)
vim.keymap.set('n', '<leader>b', fzf.buffers)
vim.keymap.set('n', '<leader>a', fzf.grep_project)

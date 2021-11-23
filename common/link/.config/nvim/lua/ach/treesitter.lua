local configs = require('nvim-treesitter.configs')

configs.setup({
    ensure_installed = { 'ruby' },
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
})

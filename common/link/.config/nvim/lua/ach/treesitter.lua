local configs = require('nvim-treesitter.configs')

configs.setup({
    ensure_installed = {
        'ruby',
        'typescript',
        'tsx',
        'javascript',
        'jsonc',
        'json',
        'lua',
    },
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
})

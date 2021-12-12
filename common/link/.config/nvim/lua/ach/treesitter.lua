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
        'vue',
        'css',
        'scss',
    },
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
})

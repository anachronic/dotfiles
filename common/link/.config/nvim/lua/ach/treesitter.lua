local configs = require('nvim-treesitter.configs')

configs.setup({
    ensure_installed = {
        'css',
        'javascript',
        'json',
        'jsonc',
        'lua',
        'ruby',
        'scss',
        'tsx',
        'toml',
        'typescript',
        'vue',
    },
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
})

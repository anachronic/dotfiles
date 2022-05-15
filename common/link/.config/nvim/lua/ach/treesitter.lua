local configs = require('nvim-treesitter.configs')

configs.setup({
    ensure_installed = {
        'css',
        'graphql',
        'javascript',
        'json',
        'jsonc',
        'lua',
        'python',
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

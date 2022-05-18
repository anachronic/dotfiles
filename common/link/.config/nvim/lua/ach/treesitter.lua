local configs = require('nvim-treesitter.configs')

configs.setup({
    ensure_installed = {
        'css',
        'graphql',
        'html',
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
        enable = true,
    },
    indent = {
        enable = true,
    },
    endwise = {
        enable = true,
    },
})

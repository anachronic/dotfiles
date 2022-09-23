local configs = require('nvim-treesitter.configs')

configs.setup({
    ensure_installed = {
        'bash',
        'css',
        'go',
        'graphql',
        'html',
        'javascript',
        'json',
        'jsonc',
        'lua',
        'markdown',
        'ruby',
        'rust',
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

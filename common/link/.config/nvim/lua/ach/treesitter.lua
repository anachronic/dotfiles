local configs = require('nvim-treesitter.configs')

configs.setup({
    ensure_installed = {
        'bash',
        'css',
        'dockerfile',
        'fish',
        'gitignore',
        'go',
        'gomod',
        'graphql',
        'help',
        'html',
        'javascript',
        'json',
        'jsonc',
        'lua',
        'markdown',
        'php',
        'ruby',
        'rust',
        'scss',
        'sql',
        'sxhkdrc',
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

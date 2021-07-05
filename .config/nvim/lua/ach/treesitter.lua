require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'query', 'javascript', 'typescript', 'tsx', 'python', 'html',
        'graphql', 'lua', 'yaml', 'css', 'bash', 'ruby'
    },
    indent = {
        enable = false,
    },
    highlight = {
        enable = true,
    },
    autotag = {
        enable = true,
    }
}

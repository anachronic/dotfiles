local treesitter = require('nvim-treesitter')

treesitter.setup({
    install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "treesitter")
})

treesitter.install({
    'bash',
    'c',
    'cpp',
    'css',
    -- 'dockerfile', -- Broken coloring :(
    'fish',
    'gitignore',
    'go',
    'gomod',
    'graphql',
    'html',
    'javascript',
    'json',
    'jsonc',
    'lua',
    'make',
    'markdown',
    'meson',
    'ninja',
    'php',
    'python',
    'rasi',
    'ruby',
    'rust',
    'scss',
    'sql',
    'sxhkdrc',
    'toml',
    'tsx',
    'twig',
    'typescript',
    'vue',
    'yaml',
    -- 'help', -- Broken for some reason
    'comment', -- sadly I'm working on projects with many FIXME and TODO comments
})

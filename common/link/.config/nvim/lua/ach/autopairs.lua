require('pairs'):setup({
    pairs = {
        ['*'] = {
            { '(', ')' },
            { '[', ']' },
            { '{', '}' },
            { '\'', '\'', { ignore_pre = '\\w' } },
            { '"', '"' },
        },
        rust = {
            { '\'', '\'', { ignore_pre = '&' } },
        },
    },
})

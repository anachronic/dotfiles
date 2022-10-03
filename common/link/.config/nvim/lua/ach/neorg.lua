local neorg = require('neorg')

neorg.setup({
    load = {
        ['core.defaults'] = {},
        ['core.norg.completion'] = {
            config = {
                engine = 'nvim-cmp',
            },
        },
    },
})

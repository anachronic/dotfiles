-- require('pairs'):setup({
--     pairs = {
--         ['*'] = {
--             { '(', ')' },
--             { '[', ']' },
--             { '{', '}' },
--             { '\'', '\'', { ignore_pre = '\\w' } },
--             { '"', '"' },
--         },
--         rust = {
--             { '\'', '\'', { ignore_pre = '\\v(\\w|\\&)' } },
--         },
--     },
-- })

local npairs = require('nvim-autopairs')

npairs.setup()

local npairs = require('nvim-autopairs')
local rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

npairs.setup()

npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
npairs.add_rules({
    rule('[ ', ' '), -- the regular [] rule will add the missing paren
    rule('{ ', ' ')
})

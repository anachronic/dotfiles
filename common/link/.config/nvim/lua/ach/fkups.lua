-- This file is to create all commands i screw up everytime

local alias = function(lhs, rhs)
    vim.cmd('cnoreabbrev ' .. lhs .. ' ' .. rhs)
end

-- caps fkups
alias('Wq', 'wq')
alias('Q', 'quit')
alias('Qa', 'qa')

-- annoying writings
alias('T', 'Telescope')
alias('gs', 'Telescope git_commits')
alias('fh', 'DiffviewFileHistory %')
alias('FileHistory', 'DiffviewFileHistory %')
alias('git', 'Git')
alias('Gti', 'Git')

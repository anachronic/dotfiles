-- colors
local cmd = vim.cmd
local p = require('wincent.pinnacle')

cmd 'silent! colorscheme nightfly'

cmd([[hi AchLspError ctermbg=0 guifg=#fa3e4d]])
cmd([[hi AchLspWarning ctermbg=0 guifg=#fad74b]])

cmd('hi LspDiagnosticsVirtualTextError ' .. p.decorate('bold,italic', 'AchLspError'))
cmd('hi LspDiagnosticsVirtualTextWarning ' .. p.decorate('bold,italic', 'AchLspWarning'))

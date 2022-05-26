-- colors
vim.g.tokyonight_style = 'night'
vim.cmd('silent! colorscheme tokyonight')

-- 👇 old config and maybe not all that needed
-- prolly gonna keep tokyo around for a while til I get bored of it

-- local p = require('wincent.pinnacle')

-- vim.cmd('silent! colorscheme nightfly')

-- local not_so_white = '#1d3b53'

-- vim.cmd('hi NonText ctermfg=none guifg=' .. not_so_white)
-- vim.cmd('hi Whitespace ctermfg=none guifg=' .. not_so_white)
--
-- vim.cmd([[hi AchLspError ctermbg=0 guifg=#fa3e4d]])
-- vim.cmd([[hi AchLspWarning ctermbg=0 guifg=#fad74b]])
--
-- vim.cmd('hi LspDiagnosticsVirtualTextError ' .. p.decorate('bold,italic', 'AchLspError'))
-- vim.cmd('hi LspDiagnosticsVirtualTextWarning ' .. p.decorate('bold,italic', 'AchLspWarning'))

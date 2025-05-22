local util = require('ach.util')

util.ts_folding()
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

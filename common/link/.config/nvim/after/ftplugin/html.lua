local util = require('ach.util')

util.indent(2)
util.ts_folding()

vim.treesitter.start()
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

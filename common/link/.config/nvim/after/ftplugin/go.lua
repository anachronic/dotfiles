-- annoying go indents with tabs
local util = require('ach.util')

vim.bo.expandtab = false

vim.treesitter.start()
util.ts_folding()
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

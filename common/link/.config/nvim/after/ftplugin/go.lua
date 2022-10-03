-- annoying go indents with tabs
local util = require('ach.util')

vim.bo.expandtab = false
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

util.ts_folding()

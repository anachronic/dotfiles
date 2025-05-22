local util = require('ach.util')

util.ts_folding()

-- vim.wo.spell = true
vim.g.vim_markdown_frontmatter = 1
vim.wo.wrap = true
vim.bo.wrapmargin = 0

vim.treesitter.start()
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

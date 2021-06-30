local util = require('ach.util')

vim.g.emmet_install_only_plug = 1
vim.g.user_emmet_complete_tag = 0

util.map('i', '<C-j>', '<plug>(emmet-expand-abbr)', {})

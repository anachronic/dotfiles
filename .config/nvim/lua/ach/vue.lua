-- try to make vim-vue a little faster
-- vim.g.vue_pre_processors = {'typescript', 'scss', 'sass'}

vim.g.vim_vue_plugin_config = { 
    syntax = {
        template = {'html'},
        script = {'javascript', 'typescript'},
        style = {'css', 'scss'},
    },
    full_syntax = {},
    initial_indent = {},
    attribute = 0,
    keyword = 0,
    foldexpr = 1,
}
